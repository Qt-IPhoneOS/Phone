#include "PhoneEngine.h"

PhoneEngine::PhoneEngine(QObject* parent)
    : QObject(parent)
    , mAppMain(&AppMain::getInstance())
{
    mContactController = new ContactController();
}

PhoneEngine::~PhoneEngine() {

}

void PhoneEngine::initialized()
{
    AppMain::getInstance();
    mAppMain->initWindow();
}

void PhoneEngine::registerGlobalContext()
{
    mAppMain->getQmlContext()->setContextProperty("ContactModel", mContactController->contactListModel());
    mAppMain->getQmlContext()->setContextProperty("ContactController", mContactController);

}

void PhoneEngine::createWindow()
{
    AppMain::getInstance().show();
}
