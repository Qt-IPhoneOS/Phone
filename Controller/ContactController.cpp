#include "ContactController.h"

ContactController::ContactController(QObject* parent)
    : QObject(parent)
{
    mContactModel = new ContactModel;
    this->setContactListModel(qobject_cast<QAbstractListModel*>(mContactModel));
}

ContactController::~ContactController() {

}

QAbstractListModel *ContactController::contactListModel() const
{
    return mContactListModel;
}

void ContactController::setContactListModel(QAbstractListModel *newContactList)
{
    if (mContactListModel == newContactList)
        return;
    mContactListModel = newContactList;
    emit contactListModelChanged();
}
