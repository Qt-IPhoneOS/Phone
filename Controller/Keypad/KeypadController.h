#ifndef KEYPADCONTROLLER_H
#define KEYPADCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include <ContactModel.h>

class KeypadController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString numberSelected READ numberSelected WRITE setNumberSelected NOTIFY numberSelectedChanged)

public:
    KeypadController();
    QString numberSelected() const;
    void setNumberSelected(const QString &newNumberSelected);

    Q_INVOKABLE void popNumber();

signals:
    void numberSelectedChanged();

private:
    QString mNumberSelected {""};
};

#endif // KEYPADCONTROLLER_H
