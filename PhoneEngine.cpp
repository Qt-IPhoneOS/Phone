#include "PhoneEngine.h"
#include "Commons/CommonDefine.h"

PhoneEngine::PhoneEngine(QObject* parent)
    : QObject(parent)
    , mAppMain(&AppMain::getInstance())
{
    mAdapterController = new AdapterController();
}

PhoneEngine::~PhoneEngine() {
    delete mAdapterController;
}

void PhoneEngine::initialized()
{
    this->registerGlobalContext();
    mAppMain->initWindow();
}

void PhoneEngine::registerGlobalContext()
{
    mAppMain->getQmlContext()->setContextProperty("ContactModel", mAdapterController->getController(TypeController::Contact));
}

void PhoneEngine::createWindow()
{
    AppMain::getInstance().show();
}
