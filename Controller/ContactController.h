#ifndef CONTACTCONTROLLER_H
#define CONTACTCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include "../Model/ContactModel.h"

class ContactController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QAbstractListModel* contactListModel READ contactListModel WRITE setContactListModel NOTIFY contactListModelChanged)
public:
    explicit ContactController(QObject* parent = nullptr);
    ~ContactController();

public:

    QAbstractListModel *contactListModel() const;
    void setContactListModel(QAbstractListModel *newContactList);

signals:
    void contactListModelChanged();

private:
    ContactModel* mContactModel {nullptr};
    QAbstractListModel *mContactListModel {nullptr};
};

#endif // CONTACTCONTROLLER_H
