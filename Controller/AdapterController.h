#ifndef ADAPTERCONTROLLER_H
#define ADAPTERCONTROLLER_H

#include <QObject>
#include <Enums.h>
#include <QMap>
#include <QHash>
#include "Controllers/ContactController.h"
#include "Controllers/FavouriteController.h"
#include "Controllers/KeypadController.h"
#include "Controllers/RecentController.h"

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
