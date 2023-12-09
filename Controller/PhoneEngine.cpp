#include "PhoneEngine.h"

PhoneEngine::PhoneEngine(QObject* parent)
    : QObject(parent)
{
    mAdapterController = AdapterController::instance();
    mScreenNavigator = ScreenNagivator::instance();

    mScreenNavigator->registerScreen(Enums::PHO_Contact, "PHO_Contact", "qrc:/Resources/Screens/PHO_Contact.qml");
    mScreenNavigator->registerScreen(Enums::PHO_Favourites, "PHO_Favourites", "qrc:/Resources/Screens/PHO_Favourites.qml");
    mScreenNavigator->registerScreen(Enums::PHO_Recents, "PHO_Recents", "qrc:/Resources/Screens/PHO_Recents.qml");
    mScreenNavigator->registerScreen(Enums::PHO_KeyPad, "PHO_KeyPad", "qrc:/Resources/Screens/PHO_KeyPad.qml");
    mScreenNavigator->registerScreen(Enums::PHO_VoiceMail, "PHO_VoiceMail", "qrc:/Resources/Screens/PHO_VoiceMail.qml");
}

PhoneEngine::~PhoneEngine()
{
    delete mAdapterController;
}

void PhoneEngine::initialized()
{
    if (createWindow())
    {
        showScreen(Enums::PHO_Contact);

        mAdapterController->initialize();
    }
}

void PhoneEngine::registerContextProperty()
{
    mScreenNavigator->getViewer()->rootContext()->setContextProperty("AppEngine", this);
    mScreenNavigator->getViewer()->rootContext()->setContextProperty("ContactModel", mAdapterController->getContactController());
    mScreenNavigator->getViewer()->rootContext()->setContextProperty("RecentModel", mAdapterController->getRecentController());
}

bool PhoneEngine::createWindow()
{
    if (mScreenNavigator->getViewer() == nullptr)
        return false;

    registerContextProperty();
    registerEnumType();

    mScreenNavigator->createView();

    return true;
}

void PhoneEngine::registerEnumType()
{
    qmlRegisterType<Enums>("Enums", 1, 0, "Enums");
}

void PhoneEngine::showScreen(const uchar &screen)
{
    setScreenActive(screen);
    mScreenNavigator->showScreen(screen);
}

int PhoneEngine::screenActive() const
{
    return mScreenActive;
}

void PhoneEngine::setScreenActive(int newScreenActive)
{
    if (mScreenActive == newScreenActive)
        return;
    mScreenActive = newScreenActive;
    emit screenActiveChanged();
}
