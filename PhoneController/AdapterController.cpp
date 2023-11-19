#include "AdapterController.h"
#include <QDebug>

AdapterController::AdapterController()
{
    mListController[TypeController::Contact] = new ContactController();
    mListController[TypeController::Favourite] = new FavouriteController();
    mListController[TypeController::Keypad] = new KeypadController();
    mListController[TypeController::Recent] = new RecentController();
}

AdapterController::~AdapterController()
{

}

PhoneController *AdapterController::getController(TypeController type)
{
    switch (type) {
    case TypeController::Contact:
        return mListController[TypeController::Contact];
        break;
    case TypeController::Favourite:
        return mListController[TypeController::Favourite];
        break;
    case TypeController::Keypad:
        return mListController[TypeController::Keypad];
        break;
    case TypeController::Recent:
        return mListController[TypeController::Recent];
        break;
    default:
        break;
    }
}
