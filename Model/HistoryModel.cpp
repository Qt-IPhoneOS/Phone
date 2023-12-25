#include "HistoryModel.h"
#include <QDebug>

HistoryModel::HistoryModel(QObject* parent) : QAbstractListModel(parent)
{
}

HistoryModel::~HistoryModel()
{
    mHistoryList.clear();
}

int HistoryModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return mHistoryList.size();
}

QVariant HistoryModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant{};

    if (index.row() >= mHistoryList.size() || index.row() < 0)
        return QVariant{};

    QVariant result;
    switch(role) {
    case Id:
        result = mHistoryList.at(index.row())->getId();
        break;
    case FormatName:
        result = mHistoryList.at(index.row())->getFormatName();
        break;
    case PhoneNumber:
        result = mHistoryList.at(index.row())->getPhoneNumber();
        break;
    case Time:
        result = mHistoryList.at(index.row())->getTime();
        break;
    case Avatar:
        result = mHistoryList.at(index.row())->getAvatar();
        break;
    case Type:
        result = mHistoryList.at(index.row())->getType();
    default:
        break;
    }

    return result;
}

QHash<int, QByteArray> HistoryModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Id] = "id";
    roles[FormatName] = "formatname";
    roles[PhoneNumber] = "number";
    roles[Time] = "time";
    roles[Avatar] = "avatar";
    roles[Type] = "type";
    return roles;
}

void HistoryModel::setHistoryList(const QVector<HistoryInstance*>& list)
{
    if (list.size() > 0)
        mHistoryList.clear();

    beginResetModel();
    mHistoryList = list;
    setCount(list.size());
    endResetModel();
}

void HistoryModel::appendHistory(HistoryInstance *history)
{
    for (auto& item : mHistoryList)
    {
        if (item->getId() == history->getId())
            return;
    }

    beginResetModel();
    mHistoryList.append(history);
    setCount(++mCount);
    endResetModel();
}

size_t HistoryModel::count() const
{
    return mCount;
}

void HistoryModel::setCount(size_t newCount)
{
    if (mCount == newCount)
        return;
    mCount = newCount;
    emit countChanged();
}
