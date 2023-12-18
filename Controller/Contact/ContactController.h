#ifndef CONTACTCONTROLLER_H
#define CONTACTCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include <ContactModel.h>

class ContactController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QAbstractListModel* dataModel READ dataModel WRITE setDataModel NOTIFY dataModelChanged)
    Q_PROPERTY(size_t lastFavIndex READ lastFavIndex WRITE setLastFavIndex NOTIFY lastFavIndexChanged)

public:
    explicit ContactController();
    ~ContactController();

    QAbstractListModel *dataModel() const;
    void setDataModel(QAbstractListModel *model);

public:
    void setContactList(const QVector<ContactInstance*>& list);

    size_t lastFavIndex() const;
    void setLastFavIndex(size_t newLastFavIndex);

signals:
    void dataModelChanged();

    void lastFavIndexChanged();

private:
    ContactModel* mContactModel {nullptr};
    QAbstractListModel *mDataModel {nullptr};
    size_t mLastFavIndex;
};

#endif // CONTACTCONTROLLER_H
