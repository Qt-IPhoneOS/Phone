#include "phoneengine.h"

PhoneEngine::PhoneEngine(QObject* parent)
    : QObject(parent)
{
}

PhoneEngine::~PhoneEngine() {
}

PhoneEngine &PhoneEngine::getInstance()
{
    static PhoneEngine instance;
    return instance;
}

void PhoneEngine::init()
{

}

void PhoneEngine::registerGlobalContext(QQuickView* view)
{
    view->rootContext()->setContextProperty("ContactList", PhoneController::getInstance().contactList());
    view->rootContext()->setContextProperty("PhoneController", &PhoneController::getInstance());
}

void PhoneEngine::show(QQuickView *view)
{
    view->setWidth(428);
    view->setHeight(926);
    view->setSource(QUrl("qrc:/Resources/Screens/PHONE_MAIN_SCREEN.qml"));
    view->show();
}
