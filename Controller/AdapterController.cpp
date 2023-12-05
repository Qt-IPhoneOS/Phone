#include "AdapterController.h"
#include <QDebug>

AdapterController::AdapterController()
{
}

AdapterController::~AdapterController()
{

}

void AdapterController::initialize()
{
    PhoneBookAdapter::instance().connect();
    SIMAdapter::instance().connect();
}

