#include <QtQuick/QQuickView>
#include <QtQml/QQmlContext>
#include <QGuiApplication>
#include "PhoneEngine.h"

int main(int argc, char* argv[]) {

    QGuiApplication app(argc, argv);
    PhoneEngine* engine = new PhoneEngine();
    engine->initialized();
    return app.exec();
}
