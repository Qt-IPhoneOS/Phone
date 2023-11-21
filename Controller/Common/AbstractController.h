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

    virtual bool onShowScreen();

};

#endif // ABSTRACTCONTROLLER_H
