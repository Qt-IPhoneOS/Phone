#ifndef PHONEENGINE_H
#define PHONEENGINE_H

#include <QObject>
#include <QtQuick/QQuickView>

class PhoneEngine : public QObject
{
    Q_OBJECT
public:
    explicit PhoneEngine(QObject* parent = nullptr);
    ~PhoneEngine();

public:
    PhoneEngine& getInstance();

    void init();
    void registerContext();
    void show(QQuickView* view);

private:
    QString m_sNameApp {""};

};

#endif // PHONEENGINE_H
