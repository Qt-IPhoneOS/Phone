#include "AdapterController.h"
#include <QDebug>

AdapterController::AdapterController()
{
    mListController[Enums::Contact] = new ContactController();
    mListController[Enums::Favourite] = new FavouriteController();
    mListController[Enums::Keypad] = new KeypadController();
    mListController[Enums::Recent] = new RecentController();
}

AdapterController::~AdapterController()
{

}

AbstractController *AdapterController::getController(Enums::TypeController type)
{
    switch (type) {
    case Enums::Contact:
        return mListController[Enums::Contact];
        break;
    case Enums::Favourite:
        return mListController[Enums::Favourite];
        break;
    case Enums::Keypad:
        return mListController[Enums::Keypad];
        break;
    case Enums::Recent:
        return mListController[Enums::Recent];
        break;
    default:
        break;
    }
}
