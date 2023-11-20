#ifndef CONTACTCONTROLLER_H
#define CONTACTCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include "../../PhoneProperties/PhoneModel.h"
#include <QAbstractListModel>
#include "Common/PhoneController.h"

class ContactController : public PhoneController
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
