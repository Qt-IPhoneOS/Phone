#include "PhoneEngine.h"

PhoneEngine::PhoneEngine(QObject* parent)
    : QObject(parent)
{
    mAdapterController = new AdapterController();
    mScreenNavigator = ScreenNagivator::instance();
    mContactController = mAdapterController->getController<ContactController>(Enums::ContactType);

    mScreenNavigator->registerScreen(Enums::ContactScreen, "PHO_Contact", CONTACTSCREENSOURCE);
    mScreenNavigator->registerScreen(Enums::FavouritesScreen, "PHO_Favourite", FAVOURITESCREENSOURCE);
    mScreenNavigator->registerScreen(Enums::RecentsScreen, "PHO_Recent", RECENTSCREENSOURCE);
    mScreenNavigator->registerScreen(Enums::KeyPadScreen, "PHO_Keypad", KEYPADSCREENSOURCE);
    mScreenNavigator->registerScreen(Enums::VoiceMailScreen, "PHO_VoiceMail", VOICEMAILSCREENSOURCE);
}

PhoneEngine::~PhoneEngine()
{
    delete mAdapterController;
}

void PhoneEngine::initialized()
{
    if (createWindow())
    {
        mScreenNavigator->showScreen(Enums::ContactScreen);
    }
}

void PhoneEngine::registerContextProperty()
{
    mScreenNavigator->getViewer()->rootContext()->setContextProperty("ContactModel", mContactController);
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
