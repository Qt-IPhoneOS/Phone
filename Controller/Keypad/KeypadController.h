#ifndef KEYPADCONTROLLER_H
#define KEYPADCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include <PhoneModel.h>
#include <QAbstractListModel>
#include "Common/PhoneController.h"

class KeypadController : public PhoneController
{
    Q_OBJECT
public:
    KeypadController();
};

#endif // KEYPADCONTROLLER_H
