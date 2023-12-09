#include "ContactController.h"

ContactController::ContactController()
{
    mContactModel = new ContactModel();
    setDataModel(qobject_cast<QAbstractListModel*>(mContactModel));
}

ContactController::~ContactController() {
    delete mContactModel;
}

QAbstractListModel *ContactController::dataModel() const
{
    return mDataModel;
}

void ContactController::setDataModel(QAbstractListModel *model)
{
    if (mDataModel == model)
        return;

    mDataModel = model;
    emit dataModelChanged();
}

void ContactController::setContactList(const QVector<ContactInstance*>& list)
{
    mContactModel->setContactList(list);
}
