#include "PhoneEngine.h"
#include "Commons/CommonDefine.h"

PhoneEngine::PhoneEngine(QObject* parent)
    : QObject(parent)
{
    mAdapterController = new AdapterController();
}

PhoneEngine::~PhoneEngine()
{
    delete mAdapterController;
}

void PhoneEngine::initialized()
{
    if (createWindow())
    {
        //        mSettingController->initialized();
        //mWifiController->init();
    }
}

void PhoneEngine::registerContextProperty()
{
    mView->rootContext()->setContextProperty("ContactModel", mAdapterController->getController(TypeController::Contact));
}

bool PhoneEngine::createWindow()
{
    if (nullptr == mView) {
        mView = new QQuickView();
    }

    if (mView == nullptr)
        return false;

    registerContextProperty();
    registerEnumType();

    mView->setWidth(700);
    mView->setHeight(1100);
    mView->setSource(QUrl("qrc:/Resources/Screens/MainPhoneScreen.qml"));
    mView->show();

    return true;
}

void PhoneEngine::registerEnumType()
{
    //qmlRegisterType<Enums>("Enums", 1, 0, "Enums");
}
