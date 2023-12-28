#include "RecentController.h"

RecentController::RecentController()
{
    mHistoryModel = new HistoryModel();
    setDataModel(qobject_cast<QAbstractListModel*>(mHistoryModel));
}

RecentController::~RecentController() {
    delete mHistoryModel;
}

QAbstractListModel *RecentController::dataModel() const
{
    return mDataModel;
}

void RecentController::setDataModel(QAbstractListModel *model)
{
    if (mDataModel == model)
        return;
    mDataModel = model;
    emit dataModelChanged();
}

void RecentController::setRecentsList(const QVector<HistoryInstance*>& list)
{
    mHistoryModel->setHistoryList(list);
}

Enums::RecentsMode RecentController::recentMode() const
{
    return mRecentMode;
}

void RecentController::setRecentMode(Enums::RecentsMode newRecentMode)
{
    if (mRecentMode == newRecentMode)
        return;
    mRecentMode = newRecentMode;
    emit recentModeChanged();
}
