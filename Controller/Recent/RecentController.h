#ifndef RECENTCONTROLLER_H
#define RECENTCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include <PhoneModel.h>
#include <QAbstractListModel>
#include "Common/PhoneController.h"

class RecentController : public PhoneController
{
    Q_OBJECT
public:
    RecentController();
};

#endif // RECENTCONTROLLER_H
