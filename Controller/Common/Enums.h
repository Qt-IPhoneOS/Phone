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
        PHO_Contact,
        PHO_Favourites,
        PHO_Recents,
        PHO_KeyPad,
        PHO_VoiceMail
    };

    Q_ENUM(PhoneType)
    Q_ENUM(ScreenDefine)
};
