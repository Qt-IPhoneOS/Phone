#ifndef PHONEENGINE_H
#define PHONEENGINE_H

#include <QObject>
#include <QQuickView>
#include <QQmlContext>
#include "PhoneModel.h"
#include "Controller/AdapterController.h"

class PhoneEngine : public QObject
{
    Q_OBJECT
public:
    explicit PhoneEngine(QObject* parent = nullptr);
    ~PhoneEngine();

public:
    bool createWindow();
    void initialized();
    void registerContextProperty();
    void registerEnumType();

private:
    QQuickView* mView {nullptr};
    AdapterController* mAdapterController {nullptr};
};

#endif // PHONEENGINE_H
