#ifndef ADAPTERCONTROLLER_H
#define ADAPTERCONTROLLER_H

#include <QObject>
#include <Common/Enums.h>
#include <unordered_map>
#include <Contact/ContactController.h>
#include <Favourite/FavouriteController.h>
#include <Keypad/KeypadController.h>
#include <Recent/RecentController.h>
#include <PhoneBook/PhoneBookAdapter.h>
#include <SIM/SIMAdapter.h>

class AdapterController : public QObject
{
    Q_OBJECT

    AdapterController();
public:
    ~AdapterController();
    static AdapterController* instance();

    ContactController* getContactController() const { return mContactController; }
    RecentController* getRecentController() const { return mRecentController; }

    void initialize();

public slots:
    void handleUpdateContactList(const std::list<ContactInfo>& list);
    void handleUpdateHistoryList(const std::list<HistoryInfo>& list);

private:
    signal::Connect mUpdateConnectList;
    signal::Connect mUpdateHistoryList;

    ContactController* mContactController;
    RecentController* mRecentController;

    Enums::PhoneType mCurrentType {Enums::ContactType};
    QVector<ContactInstance*> mContactList;
    QVector<HistoryInstance*> mHistoryList;
};

#endif // ADAPTERCONTROLLER_H
