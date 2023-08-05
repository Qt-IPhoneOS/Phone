#include "phoneengine.h"

PhoneEngine::PhoneEngine(QObject* parent)
    : QObject(parent)
{

}

PhoneEngine::~PhoneEngine() {

}

PhoneEngine &PhoneEngine::getInstance()
{

}

void PhoneEngine::init()
{

}

void PhoneEngine::registerContext()
{

}

void PhoneEngine::show(QQuickView *view)
{
    view->setSource(QUrl("qrc:/main.qml"));
    view->show();
}
