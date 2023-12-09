#ifndef CONTACTMODEL_H
#define CONTACTMODEL_H

#include <QAbstractListModel>
#include <QVariant>
#include <QVector>
#include "ContactInstance.h"

class ContactModel : public QAbstractListModel {
    Q_OBJECT

public:
    ContactModel(QObject* parent = nullptr);
    ~ContactModel();
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    void setContactList(const QVector<ContactInstance*>& list);
    void appendContact(ContactInstance* contact);

private:
    enum Role {
        Id,
        FirstName,
        LastName,
        FormatName,
        PhoneNumber,
        Avatar,
        IsFav
    };

    QVector<ContactInstance*> mContactList;
};

#endif // COMODEL_H
