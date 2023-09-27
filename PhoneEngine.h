#ifndef PHONEENGINE_H
#define PHONEENGINE_H

#include <QObject>
#include <QtQuick/QQuickView>
#include <QQmlContext>
#include "Model/ContactModel.h"
#include "AppWindow/AppMain.h"
#include "Controller/ContactController.h"

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
    ContactController* mContactController {nullptr};
};

#endif // PHONEENGINE_H
