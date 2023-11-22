#include "PhoneEngine.h"

PhoneEngine::PhoneEngine(QObject* parent)
    : QObject(parent)
{
    mAdapterController = new AdapterController();
    mScreenNavigator = ScreenNagivator::instance();
    mContactController = mAdapterController->getController<ContactController>(Enums::ContactType);

    std::unordered_map<uchar, QString> screens = {
        {Enums::ContactScreen, CONTACTSCREENSOURCE},
        {Enums::FavouritesScreen, FAVOURITESCREENSOURCE},
        {Enums::RecentsScreen, RECENTSCREENSOURCE},
        {Enums::KeyPadScreen, KEYPADSCREENSOURCE},
        {Enums::VoiceMailScreen, VOICEMAILSCREENSOURCE}
    };
}

PhoneEngine::~PhoneEngine()
{
    delete mAdapterController;
}

void PhoneEngine::initialized()
{
    if (createWindow())
    {
        mScreenNavigator->showScreen(Enums::FavouritesScreen);
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
