#include <QtQuick/QQuickView>
#include <QtQml/QQmlContext>
#include <QGuiApplication>
#include "phoneengine.h"

int main(int argc, char* argv[]) {

    QGuiApplication app(argc, argv);
    PhoneEngine phoneEngine;
    QQuickView m_view;

    phoneEngine.show(&m_view);
    return app.exec();
}
