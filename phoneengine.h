#ifndef PHONEENGINE_H
#define PHONEENGINE_H

#include <QObject>
#include <QtQuick/QQuickView>
#include <QQmlContext>
#include "Models/phonemodel.h"

class PhoneEngine : public QObject
{
    Q_OBJECT
private:
    explicit PhoneEngine(QObject* parent = nullptr);
    ~PhoneEngine();

public:
    static PhoneEngine &getInstance();

    void init();
    void registerContext(QQuickView* view, PhoneModel* model);
    void show(QQuickView* view);

private:
    QString m_sNameApp {""};

};

#endif // PHONEENGINE_H
