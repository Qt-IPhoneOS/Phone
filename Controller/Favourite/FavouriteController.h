#ifndef FAVOURITECONTROLLER_H
#define FAVOURITECONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include <PhoneModel.h>
#include <QAbstractListModel>
#include "Common/AbstractController.h"

class FavouriteController : public AbstractController
{
    Q_OBJECT
public:
    FavouriteController();
};

#endif // FAVOURITECONTROLLER_H
