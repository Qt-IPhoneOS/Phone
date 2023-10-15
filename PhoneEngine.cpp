#include "PhoneEngine.h"
#include "Commons/CommonDefine.h"

PhoneEngine::PhoneEngine(QObject* parent)
    : QObject(parent)
    , mAppMain(&AppMain::getInstance())
    , mAdapterController(&AdapterController::getInstance())
{

}

PhoneEngine::~PhoneEngine() {
    delete mAppMain;
    delete mAdapterController;
}

void PhoneEngine::initialized()
{
    this->registerGlobalContext();
    mAppMain->initWindow();
}

void PhoneEngine::registerGlobalContext()
{
    qWarning() << "Register Context";
    mAppMain->getQmlContext()->setContextProperty("ContactModel", mAdapterController->getController(xhtdrlx::TypeController::CONTACT));
}

void PhoneEngine::createWindow()
{
    qWarning() << "Show hrereeeeeee";
    AppMain::getInstance().show();
}
