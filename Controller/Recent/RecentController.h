#ifndef RECENTCONTROLLER_H
#define RECENTCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include <PhoneModel.h>
#include <QAbstractListModel>
#include "Common/AbstractController.h"

class RecentController : public AbstractController
{
    Q_OBJECT
public:
    RecentController();
};

#endif // RECENTCONTROLLER_H
