#include "ContactController.h"
#include <algorithm>

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

void ContactController::setContactList(QList<ContactInstance*>& list)
{
    std::sort(list.begin(), list.end(), [](ContactInstance* ins1, ContactInstance* ins2) {
        return ins1->getFormatName() < ins2->getFormatName();
    });

    QString heading = "";
    int count = 0;
    for (auto& item : list)
    {
        if (item->getFormatName().at(0) != heading)
        {
            item->setIsHeading(true);
            count++;
        }
        heading = item->getFormatName().at(0);
    }
    setHeadingCount(count);
    mContactModel->setContactList(list);
}

int ContactController::headingCount() const
{
    return mHeadingCount;
}

void ContactController::setHeadingCount(int newHeadingCount)
{
    if (mHeadingCount == newHeadingCount)
        return;
    mHeadingCount = newHeadingCount;
    emit headingCountChanged();
}
