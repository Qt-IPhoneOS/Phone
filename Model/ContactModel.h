#ifndef CONTACTMODEL_H
#define CONTACTMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "PhoneProperties/PhoneInfo.h"

#define ASCII_A 65
#define ASCII_Z 90

class ContactModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit ContactModel(QObject* parent = nullptr);
    ~ContactModel();

public:
    Q_INVOKABLE int rowCount(const QModelIndex& parent = QModelIndex()) const final override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const final override;

    enum ContactRole {
        NameContact = Qt::UserRole + 1,
        PhoneNumber,
        Avartar,
        Notes,
        Section
    };

    QHash<int,QByteArray> roleNames() const override {
        QHash<int, QByteArray> roles;
        roles[ContactRole::NameContact] = "NameContact";
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


class GroundOfName : public QAbstractListModel
{
    Q_OBJECT
public:
    GroundOfName(QObject* parent = nullptr);
    ~GroundOfName();

private:

};

#endif // CONTACTMODEL_H
