#ifndef ABSTRACTCONTROLLER_H
#define ABSTRACTCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>

class AbstractController : public QObject
{
    Q_OBJECT
public:
    virtual ~AbstractController();

public:
//    virtual void dialOut() = 0;
//    virtual void sendMessage(QString message) = 0;
//    virtual void videoCall() = 0;
//    virtual void sendMail() = 0;

};

inline AbstractController::~AbstractController()
{

}

#endif // ABSTRACTCONTROLLER_H
