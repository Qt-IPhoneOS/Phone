#ifndef PHONEENGINE_H
#define PHONEENGINE_H

#include <QObject>
#include <QQuickView>
#include <QQmlContext>
#include <unordered_map>
#include <ScreenNavigator.h>
#include "Common/PhoneDefines.h"
#include "ContactModel.h"
#include "AdapterController.h"

class PhoneEngine : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int screenActive READ screenActive WRITE setScreenActive NOTIFY screenActiveChanged)

public:
    explicit PhoneEngine(QObject* parent = nullptr);
    ~PhoneEngine();

public:
    bool createWindow();
    void initialized();
    void registerContextProperty();
    void registerEnumType();

    Q_INVOKABLE void showScreen(const uchar&);

    int screenActive() const;
    void setScreenActive(int newScreenActive);

signals:
    void screenActiveChanged();

private:
    QQuickView* mView {nullptr};
    AdapterController* mAdapterController {nullptr};
    uicommon::ScreenNagivator* mScreenNavigator;
    int mScreenActive {0};
};

#endif // PHONEENGINE_H
