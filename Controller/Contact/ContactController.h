#ifndef CONTACTCONTROLLER_H
#define CONTACTCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include <ContactModel.h>

class ContactController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QAbstractListModel* dataModel READ dataModel WRITE setDataModel NOTIFY dataModelChanged)

public:
    explicit ContactController();
    ~ContactController();

    QAbstractListModel *dataModel() const;
    void setDataModel(QAbstractListModel *model);

public:
    void setContactList(const QVector<ContactInstance*>& list);

signals:
    void dataModelChanged();

private:
    ContactModel* mContactModel {nullptr};
    QAbstractListModel *mDataModel {nullptr};
};

#endif // CONTACTCONTROLLER_H
