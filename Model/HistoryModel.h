#ifndef HISTORYMODEL_H
#define HISTORYMODEL_H

#include <QAbstractListModel>
#include <QVariant>
#include <QVector>
#include "HistoryInstance.h"

class HistoryModel : public QAbstractListModel {
    Q_OBJECT

public:
    HistoryModel(QObject* parent = nullptr);
    ~HistoryModel();
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    void setHistoryList(const QVector<HistoryInstance*>& list);
    void appendHistory(HistoryInstance* history);

private:
    enum Role {
        Id,
        FormatName,
        PhoneNumber,
        Time,
        Type
    };

    QVector<HistoryInstance*> mHistoryList;
};

#endif // HISTORYMODEL_H
