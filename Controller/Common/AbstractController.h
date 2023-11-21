#ifndef ABSTRACTCONTROLLER_H
#define ABSTRACTCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>

class AbstractController : public QObject
{
    Q_OBJECT
public:
    AbstractController();
    virtual ~AbstractController();

//    virtual void dialOut() = 0;
//    virtual void sendMessage(QString message) = 0;
//    virtual void videoCall() = 0;
//    virtual void sendMail() = 0;

};

#endif // ABSTRACTCONTROLLER_H
