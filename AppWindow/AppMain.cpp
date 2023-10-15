#include "AppMain.h"

AppMain::AppMain(QObject* parent)
    : QObject(parent)
{
    mView = new QQuickView();
    mContext = mView->rootContext();
    mEngine = mView->rootContext()->engine();
}

AppMain::~AppMain() {

}


AppMain& AppMain::getInstance() {
    static AppMain instance;
    return instance;
}

void AppMain::initWindow() {
    const QUrl url("qrc:/Resources/Screens/MainPhoneScreen.qml");
    mView->setSource(url);
}

bool AppMain::show() {
    if (!mView)
        return false;
    mView->show();
    return true;
}
