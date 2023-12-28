#ifndef CONTACTCONTROLLER_H
#define CONTACTCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include <ContactModel.h>

class ContactController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QAbstractListModel* dataModel READ dataModel WRITE setDataModel NOTIFY dataModelChanged)
    Q_PROPERTY(int headingCount READ headingCount WRITE setHeadingCount NOTIFY headingCountChanged)

public:
    explicit ContactController();
    ~ContactController();

    QAbstractListModel *dataModel() const;
    void setDataModel(QAbstractListModel *model);

public:
    void setContactList(QList<ContactInstance*>& list);

    int headingCount() const;
    void setHeadingCount(int newHeadingCount);

signals:
    void dataModelChanged();
    void headingCountChanged();

private:
    ContactModel* mContactModel {nullptr};
    QAbstractListModel *mDataModel {nullptr};
    int mHeadingCount;
};

#endif // CONTACTCONTROLLER_H
