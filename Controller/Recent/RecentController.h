#ifndef RECENTCONTROLLER_H
#define RECENTCONTROLLER_H

#include <QObject>
#include <QAbstractListModel>
#include <HistoryModel.h>
#include <Common/Enums.h>

class RecentController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QAbstractListModel* dataModel READ dataModel WRITE setDataModel NOTIFY dataModelChanged)
    Q_PROPERTY(Enums::RecentsMode recentMode READ recentMode WRITE setRecentMode NOTIFY recentModeChanged)

public:
    explicit RecentController();
    ~RecentController();

    QAbstractListModel *dataModel() const;
    void setDataModel(QAbstractListModel *model);

public:
    void setRecentsList(const QVector<HistoryInstance*>& list);

    Enums::RecentsMode recentMode() const;
    void setRecentMode(Enums::RecentsMode newRecentMode);

signals:
    void dataModelChanged();
    void recentModeChanged();

private:
    HistoryModel* mHistoryModel {nullptr};
    QAbstractListModel *mDataModel {nullptr};
    Enums::RecentsMode mRecentMode {Enums::Recent_All};
};

#endif // RECENTCONTROLLER_H
