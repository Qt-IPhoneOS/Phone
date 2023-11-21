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

    Q_ENUM(PhoneType)
};
