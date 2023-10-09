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
    qWarning() << "tesst 1";
    mView->setSource(url);
    qWarning() << "tesst 2";
}

bool AppMain::show() {
    if (!mView)
        return false;
    mView->show();
    qWarning() << "indeed show heree";
    return true;
}
