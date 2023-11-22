#include <QObject>

class Enums : public QObject {
    Q_OBJECT
public:
    Enums()
    {
    }

    enum PhoneType {
        ContactType = 0,
        FavouriteType,
        KeypadType,
        RecentType
    };

    enum ScreenDefine {
        ContactScreen,
        FavouritesScreen,
        RecentsScreen,
        KeyPadScreen,
        VoiceMailScreen
    };

    Q_ENUM(PhoneType)
    Q_ENUM(ScreenDefine)
};
