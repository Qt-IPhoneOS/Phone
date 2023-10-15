#ifndef PHONECONTROLLER_H
#define PHONECONTROLLER_H

#include <QObject>
#include <QAbstractListModel>

class PhoneController : public QObject
{
    Q_OBJECT
public:
    virtual ~PhoneController();

public:
//    virtual void dialOut() = 0;
//    virtual void sendMessage(QString message) = 0;
//    virtual void videoCall() = 0;
//    virtual void sendMail() = 0;

};

inline PhoneController::~PhoneController()
{

}

#endif // PHONECONTROLLER_H
