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

void PhoneEngine::registerContext(QQuickView* view, PhoneModel* model)
{
    view->rootContext()->setContextProperty("modelPhone", model);
}

void PhoneEngine::show(QQuickView *view)
{
    view->setSource(QUrl("qrc:/RESOURCES/Screens/MainScreenPhone.qml"));
    view->show();
}
