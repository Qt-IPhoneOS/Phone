#ifndef KEYPADCONTROLLER_H
#define KEYPADCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include <ContactModel.h>

class KeypadController : public QObject
{
    Q_OBJECT
public:
    KeypadController();
};

#endif // KEYPADCONTROLLER_H
