#ifndef FAVOURITECONTROLLER_H
#define FAVOURITECONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include <ContactModel.h>

class FavouriteController : public QObject
{
    Q_OBJECT
public:
    FavouriteController();
};

#endif // FAVOURITECONTROLLER_H
