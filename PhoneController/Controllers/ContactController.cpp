#include "ContactController.h"

ContactController::ContactController()
{
    mContactModel = new PhoneModel;
    this->setContactListModel(qobject_cast<QAbstractListModel*>(mContactModel));
}

ContactController::~ContactController() {
    delete mContactModel;
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
