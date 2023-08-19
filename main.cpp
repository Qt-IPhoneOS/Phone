#include <QtQuick/QQuickView>
#include <QtQml/QQmlContext>
#include <QGuiApplication>
#include "phoneengine.h"

int main(int argc, char* argv[]) {

    QGuiApplication app(argc, argv);
    QQuickView m_view;
    PhoneModel model;
    PhoneEngine::getInstance().registerContext(&m_view, &model);
    PhoneEngine::getInstance().show(&m_view);
    return app.exec();
}
