#ifndef PHONEENGINE_H
#define PHONEENGINE_H

#include <QObject>
#include <QQuickView>
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
    bool createWindow();
    void initialized();
    void registerContextProperty();
    void registerEnumType();

private:
    QQuickView* mView {nullptr};
    AdapterController* mAdapterController {nullptr};
};

#endif // PHONEENGINE_H
