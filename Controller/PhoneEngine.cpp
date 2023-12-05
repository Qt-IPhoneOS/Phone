#include "PhoneEngine.h"

PhoneEngine::PhoneEngine(QObject* parent)
    : QObject(parent)
{
    mAdapterController = new AdapterController();
    mScreenNavigator = ScreenNagivator::instance();
    mContactController = mAdapterController->getController<ContactController>(Enums::ContactType);

    mScreenNavigator->registerScreen(Enums::PHO_Contact, "PHO_Contact", CONTACTSCREENSOURCE);
    mScreenNavigator->registerScreen(Enums::PHO_Favourites, "PHO_Favourites", FAVOURITESCREENSOURCE);
    mScreenNavigator->registerScreen(Enums::PHO_Recents, "PHO_Recents", RECENTSCREENSOURCE);
    mScreenNavigator->registerScreen(Enums::PHO_KeyPad, "PHO_KeyPad", KEYPADSCREENSOURCE);
    mScreenNavigator->registerScreen(Enums::PHO_VoiceMail, "PHO_VoiceMail", VOICEMAILSCREENSOURCE);
}

PhoneEngine::~PhoneEngine()
{
    delete mAdapterController;
}

void PhoneEngine::initialized()
{
    if (createWindow())
    {
        mScreenNavigator->showScreen(Enums::PHO_Contact);

        mAdapterController->initialize();
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
