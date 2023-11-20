#ifndef FAVOURITECONTROLLER_H
#define FAVOURITECONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include "../../PhoneProperties/PhoneModel.h"
#include <QAbstractListModel>
#include "Common/PhoneController.h"

class FavouriteController : public PhoneController
{
    Q_OBJECT
public:
    FavouriteController();
};

#endif // FAVOURITECONTROLLER_H
