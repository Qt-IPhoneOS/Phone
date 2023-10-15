#ifndef PHONEENGINE_H
#define PHONEENGINE_H

#include <QObject>
#include <QtQuick/QQuickView>
#include <QQmlContext>
#include "PhoneProperties/PhoneModel.h"
#include "AppWindow/AppMain.h"
#include "PhoneController/AdapterController.h"

class PhoneEngine : public QObject
{
    Q_OBJECT
public:
    explicit PhoneEngine(QObject* parent = nullptr);
    ~PhoneEngine();

public:
    void initialized();
    void registerGlobalContext();
    void createWindow();

private:
    AppMain* mAppMain {nullptr};
    AdapterController* mAdapterController {nullptr};
};

#endif // PHONEENGINE_H
