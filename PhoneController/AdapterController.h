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
    ~AdapterController();
    static AdapterController& getInstance();



public:
    PhoneController* getController(xhtdrlx::TypeController type);

private:
    QHash<xhtdrlx::TypeController, PhoneController*> mListController;

private:
    AdapterController();
};

#endif // ADAPTERCONTROLLER_H
