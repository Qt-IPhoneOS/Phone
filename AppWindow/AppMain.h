#ifndef APPMAIN_H
#define APPMAIN_H

#include <QObject>
#include <QQuickView>
#include <QQmlContext>
#include <QQmlEngine>

class AppMain : public QObject
{
    Q_OBJECT
public:
    static AppMain& getInstance();
    ~AppMain();

    void initWindow();
    bool show();

    QQuickView* getQQuickView() { return mView; }
    QQmlContext* getQmlContext() { return mContext; }
    QQmlEngine* getQQmlEngine() { return mEngine; }

private:
    QQuickView*         mView {nullptr};
    QQmlContext*        mContext {nullptr};
    QQmlEngine*         mEngine {nullptr};

private:
    explicit AppMain(QObject *parent = nullptr);
};

#endif // APPMAIN_H
