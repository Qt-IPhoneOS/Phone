#ifndef ADAPTERCONTROLLER_H
#define ADAPTERCONTROLLER_H

#include <QObject>
#include "Controllers/ContactController.h"
#include "Controllers/FavouriteController.h"
#include "Controllers/KeypadController.h"
#include "Controllers/RecentController.h"
#include "../Commons/CommonDefine.h"
#include <QMap>
#include <QHash>

class AdapterController : public QObject
{
    Q_OBJECT

public:
    AdapterController();
    ~AdapterController();

public:
    PhoneController* getController(TypeController type);

private:
    QHash<TypeController, PhoneController*> mListController;

private:
};

#endif // ADAPTERCONTROLLER_H
