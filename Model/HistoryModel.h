#ifndef HISTORYMODEL_H
#define HISTORYMODEL_H

#include <QAbstractListModel>
#include <QVariant>
#include <QVector>
#include "HistoryInstance.h"

class HistoryModel : public QAbstractListModel {
    Q_OBJECT
    Q_PROPERTY(size_t count READ count WRITE setCount NOTIFY countChanged)

public:
    HistoryModel(QObject* parent = nullptr);
    ~HistoryModel();
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    void setHistoryList(const QVector<HistoryInstance*>& list);
    void appendHistory(HistoryInstance* history);

    size_t count() const;
    void setCount(size_t newCount);

signals:
    void countChanged();

private:
    enum Role {
        Id,
        FormatName,
        PhoneNumber,
        Time,
        Avatar,
        Type
    };

    QVector<HistoryInstance*> mHistoryList;
    size_t mCount;
};

#endif // HISTORYMODEL_H
