#include "AdapterController.h"
#include <QDebug>

AdapterController::AdapterController()
{
    qWarning() << "Constructor AdapterController";
    mListController[xhtdrlx::TypeController::CONTACT] = new ContactController();
    mListController[xhtdrlx::TypeController::FAVOURITE] = new FavouriteController();
    mListController[xhtdrlx::TypeController::KEYPAD] = new KeypadController();
    mListController[xhtdrlx::TypeController::RECENT] = new RecentController();
}

AdapterController::~AdapterController()
{
    qWarning() << "Destructor";
}

AdapterController &AdapterController::getInstance()
{
    static AdapterController instance;
    return instance;
}

PhoneController *AdapterController::getController(xhtdrlx::TypeController type)
{
    switch (type) {
    case xhtdrlx::TypeController::CONTACT:
        return mListController[xhtdrlx::TypeController::CONTACT];
        break;
    case xhtdrlx::TypeController::FAVOURITE:
        return mListController[xhtdrlx::TypeController::FAVOURITE];
        break;
    case xhtdrlx::TypeController::RECENT:
        return mListController[xhtdrlx::TypeController::KEYPAD];
        break;
    case xhtdrlx::TypeController::KEYPAD:
        return mListController[xhtdrlx::TypeController::RECENT];
        break;
    default:
        break;
    }
}
