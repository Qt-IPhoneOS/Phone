#ifndef KEYPADCONTROLLER_H
#define KEYPADCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include <PhoneModel.h>
#include <QAbstractListModel>
#include "Common/AbstractController.h"

class KeypadController : public AbstractController
{
    Q_OBJECT
public:
    KeypadController();
};

#endif // KEYPADCONTROLLER_H
