#include "phonecontroller.h"

PhoneController::PhoneController(QObject* parent)
    : QObject(parent)
{
    m_contactListModel = new ContactListModel;
    this->setContactList(qobject_cast<QAbstractListModel*>(m_contactListModel));
}

PhoneController::~PhoneController() {

}

PhoneController &PhoneController::getInstance()
{
    static PhoneController instance;
    return instance;
}

QAbstractListModel *PhoneController::contactList() const
{
    return m_contactList;
}

void PhoneController::setContactList(QAbstractListModel *newContactList)
{
    if (m_contactList == newContactList)
        return;
    m_contactList = newContactList;
    emit contactListChanged();
}

QVector<QString> PhoneController::listGroupName() const
{
    return m_listGroupName;
}

void PhoneController::setListGroupName(const QVector<QString> &newListGroupName)
{
    if (m_listGroupName == newListGroupName)
        return;
    m_listGroupName = newListGroupName;
    emit listGroupNameChanged();
}
