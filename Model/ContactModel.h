#ifndef CONTACTMODEL_H
#define CONTACTMODEL_H

#include <QAbstractListModel>
#include <QVariant>
#include <QVector>
#include "ContactInstance.h"

class ContactModel : public QAbstractListModel {
    Q_OBJECT
    Q_PROPERTY(size_t count READ count WRITE setCount NOTIFY countChanged)

public:
    ContactModel(QObject* parent = nullptr);
    ~ContactModel();
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    void setContactList(const QVector<ContactInstance*>& list);
    void appendContact(ContactInstance* contact);

    size_t count() const;
    void setCount(size_t newCount);

signals:
    void countChanged();

private:
    enum Role {
        Id,
        FirstName,
        LastName,
        FormatName,
        PhoneNumber,
        Avatar,
        IsFav,
        Section,
        IsHeading
    };

    QVector<ContactInstance*> mContactList;
    size_t mCount;
};

#endif // COMODEL_H
