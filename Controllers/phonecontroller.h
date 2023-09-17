#ifndef PHONECONTROLLER_H
#define PHONECONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include "../Models/contactlistmodel.h"

class PhoneController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QAbstractListModel* contactList READ contactList WRITE setContactList NOTIFY contactListChanged)
    Q_PROPERTY(QVector<QString> listGroupName READ listGroupName WRITE setListGroupName NOTIFY listGroupNameChanged)

private:
    PhoneController(QObject* parent = nullptr);

public:
    ~PhoneController();

    static PhoneController &getInstance();

    QAbstractListModel *contactList() const;
    void setContactList(QAbstractListModel *newContactList);

    QVector<QString> listGroupName() const;
    void setListGroupName(const QVector<QString> &newListGroupName);

signals:
    void contactListChanged();

    void listGroupNameChanged();

private:
    ContactListModel* m_contactListModel;

    QAbstractListModel *m_contactList = nullptr;
    QVector<QString> m_listGroupName;
};

#endif // PHONECONTROLLER_H
