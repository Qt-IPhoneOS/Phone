#ifndef RECENTCONTROLLER_H
#define RECENTCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include <HistoryModel.h>

class RecentController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QAbstractListModel* dataModel READ dataModel WRITE setDataModel NOTIFY dataModelChanged)

public:
    explicit RecentController();
    ~RecentController();

    QAbstractListModel *dataModel() const;
    void setDataModel(QAbstractListModel *model);

public:
    void setRecentsList(const QVector<HistoryInstance*>& list);

signals:
    void dataModelChanged();

private:
    HistoryModel* mHistoryModel {nullptr};
    QAbstractListModel *mDataModel {nullptr};
};

#endif // RECENTCONTROLLER_H
