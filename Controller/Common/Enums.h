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
        PHO_Contact = 0,
        PHO_Favourites,
        PHO_Recents,
        PHO_KeyPad,
        PHO_VoiceMail
    };

    enum PhoneCallingType {
        Missed,
        Outgoing,
        Incoming,
        Unknown
    };

    Q_ENUM(PhoneType)
    Q_ENUM(ScreenDefine)
    Q_ENUM(PhoneCallingType)
};
