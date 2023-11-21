#ifndef ADAPTERCONTROLLER_H
#define ADAPTERCONTROLLER_H

#include <QObject>
#include <Common/Enums.h>
#include <QMap>
#include <QHash>
#include <Contact/ContactController.h>
#include <Favourite/FavouriteController.h>
#include <Keypad/KeypadController.h>
#include <Recent/RecentController.h>

class AdapterController : public QObject
{
    Q_OBJECT

public:
    AdapterController();
    ~AdapterController();

public:
    PhoneController* getController(Enums::TypeController type);

private:
    QHash<Enums::TypeController, PhoneController*> mListController;

private:
};

#endif // ADAPTERCONTROLLER_H
