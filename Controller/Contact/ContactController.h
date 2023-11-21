#ifndef CONTACTCONTROLLER_H
#define CONTACTCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include <PhoneModel.h>
#include <QAbstractListModel>
#include "Common/AbstractController.h"

class ContactController : public AbstractController
{
    Q_OBJECT
    Q_PROPERTY(QAbstractListModel* contactListModel READ contactListModel WRITE setContactListModel NOTIFY contactListModelChanged)
public:
    explicit ContactController();
    ~ContactController();

public:

    QAbstractListModel *contactListModel() const;
    void setContactListModel(QAbstractListModel *newContactList);

signals:
    void contactListModelChanged();

private:
    PhoneModel* mContactModel {nullptr};
    QAbstractListModel *mContactListModel {nullptr};
};

#endif // CONTACTCONTROLLER_H