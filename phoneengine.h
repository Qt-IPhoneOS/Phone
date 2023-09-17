#ifndef PHONEENGINE_H
#define PHONEENGINE_H

#include <QObject>
#include <QtQuick/QQuickView>
#include <QQmlContext>
#include <Models/contactlistmodel.h>
#include <Controllers/phonecontroller.h>

class PhoneEngine : public QObject
{
    Q_OBJECT
private:
    explicit PhoneEngine(QObject* parent = nullptr);
    ~PhoneEngine();

public:
    static PhoneEngine &getInstance();

    void init();
    void registerGlobalContext(QQuickView* view);
    void show(QQuickView* view);

    QAbstractListModel& getContactList();

private:
    QString m_sNameApp {""};

};

#endif // PHONEENGINE_H
