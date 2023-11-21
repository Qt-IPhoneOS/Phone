#include <QObject>

class Enums : public QObject {
    Q_OBJECT
public:
    Enums()
    {
    }

    enum TypeController {
        Contact = 0,
        Favourite,
        Keypad,
        Recent
    };

    Q_ENUM(TypeController)
};
