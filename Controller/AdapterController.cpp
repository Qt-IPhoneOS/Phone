#include "AdapterController.h"
#include <QDebug>

AdapterController::AdapterController()
{
    mContactController = new ContactController();
    mRecentController = new RecentController();
    mKeypadController = new KeypadController();

    mUpdateConnectList = midlayer::PhoneBookAdapter::instance().onContactListChanged.connect([this](const std::list<midlayer::ContactInfo>& list){
        QMetaObject::invokeMethod(this, "handleUpdateContactList", Qt::QueuedConnection,
                                  Q_ARG(const std::list<midlayer::ContactInfo>&, list));
    });

    mUpdateHistoryList = midlayer::PhoneBookAdapter::instance().onHistoryListChanged.connect([this](const std::list<midlayer::HistoryInfo>& list){
        QMetaObject::invokeMethod(this, "handleUpdateHistoryList", Qt::QueuedConnection,
                                  Q_ARG(const std::list<midlayer::HistoryInfo>&, list));
    });
}

AdapterController::~AdapterController()
{

}

AdapterController* AdapterController::instance()
{
    static AdapterController* ins = nullptr;
    if (ins == nullptr)
    {
        ins = new AdapterController();
    }
    return ins;
}

void AdapterController::initialize()
{
    midlayer::PhoneBookAdapter::instance().connect();
    midlayer::SIMAdapter::instance().connect();
}

void AdapterController::handleUpdateContactList(const std::list<midlayer::ContactInfo>& list)
{
    if (mContactController == nullptr)
        return;

    qWarning() << "handleUpdateContacts " << list.size();
    mContactList.clear();

    for (auto item = list.begin(); item != list.end(); ++item)
    {
        QString photo = "";
        if (item->photo != "")
        {
            photo.append("data:image/png;base64,").append(QString::fromStdString(item->photo));
        }
        ContactInstance* contact = new ContactInstance(item->id, QString::fromStdString(item->firstName), QString::fromStdString(item->lastName), QString::fromStdString(item->formatName),
                                                       QString::fromStdString(item->phoneNumber), photo, item->isFav);
        mContactList.emplace_back(contact);
    }

    mContactController->setContactList(mContactList);
}

void AdapterController::handleUpdateHistoryList(const std::list<midlayer::HistoryInfo>& list)
{
    if (mContactController == nullptr)
        return;

    qWarning() << "handleUpdateHistoryList " << list.size();

    mHistoryList.clear();

    for (auto item = list.begin(); item != list.end(); ++item)
    {
        HistoryInstance* history = new HistoryInstance(item->id, QString::fromStdString(item->formatName), QString::fromStdString(item->phoneNumber),
                                                       QString::fromStdString(item->time), item->callingType);
        mHistoryList.emplace_back(history);
    }

    mRecentController->setRecentsList(mHistoryList);
}

