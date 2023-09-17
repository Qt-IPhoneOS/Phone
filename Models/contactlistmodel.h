#ifndef CONTACTLISTMODEL_H
#define CONTACTLISTMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "PhoneProperties/phoneinfo.h"

#define ASCII_A 65
#define ASCII_Z 90

class ContactListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit ContactListModel(QObject* parent = nullptr);
    ~ContactListModel();

public:
    Q_INVOKABLE int rowCount(const QModelIndex& parent = QModelIndex()) const final override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const final override;

    enum ContactRole {
        NameContact = Qt::UserRole + 1,
        PhoneNumber,
        Avartar,
        Notes
    };

    QHash<int,QByteArray> roleNames() const override {
        QHash<int, QByteArray> roles;
        roles[ContactRole::NameContact] = "NameContact";
        roles[ContactRole::PhoneNumber] = "PhoneNumber";
        roles[ContactRole::Avartar] = "AvatarSource";
        roles[ContactRole::Notes] = "NoteContent";
        return roles;
    }

signals:
    void contactListChanged();
private:
    QList<ContactInfo> mContact;
};


class GroundOfName
{
public:
    GroundOfName();
    ~GroundOfName();

private:

};

#endif // CONTACTLISTMODEL_H
