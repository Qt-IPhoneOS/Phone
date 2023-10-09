#ifndef PHONEMODEL_H
#define PHONEMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "Common/PhoneInstance.h"

class PhoneModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit PhoneModel(QObject* parent = nullptr);
    ~PhoneModel();

public:
    Q_INVOKABLE int rowCount(const QModelIndex& parent = QModelIndex()) const final override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const final override;

    enum ContactRole {
        Name = Qt::UserRole + 1,
        PhoneNumber,
        Avartar,
        Notes,
        Section
    };

    QHash<int,QByteArray> roleNames() const override {
        QHash<int, QByteArray> roles;
        roles[ContactRole::Name] = "Name";
        roles[ContactRole::PhoneNumber] = "PhoneNumber";
        roles[ContactRole::Avartar] = "AvatarSource";
        roles[ContactRole::Notes] = "NoteContent";
        roles[ContactRole::Section] = "Section";
        return roles;
    }

signals:
    void contactListChanged();
private:
    QList<ContactInfo> mContact;
};

#endif // PHONEMODEL_H
