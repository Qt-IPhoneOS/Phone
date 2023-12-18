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
    auto index = -1;
    int count = 0;
    for (auto item : list)
    {
        if (item->getIsFav())
        {
            index = count;
        }
        ++count;
    }
    setLastFavIndex(index);
    mContactModel->setContactList(list);
}

size_t ContactController::lastFavIndex() const
{
    return mLastFavIndex;
}

void ContactController::setLastFavIndex(size_t newLastFavIndex)
{
    if (mLastFavIndex == newLastFavIndex)
        return;
    mLastFavIndex = newLastFavIndex;
    emit lastFavIndexChanged();
}
