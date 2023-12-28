#include "ContactModel.h"
#include <QDebug>

ContactModel::ContactModel(QObject* parent) : QAbstractListModel(parent)
{
}

ContactModel::~ContactModel()
{
    mContactList.clear();
}

int ContactModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return mContactList.size();
}

QVariant ContactModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant{};

    if (index.row() >= mContactList.size() || index.row() < 0)
        return QVariant{};

    QVariant result;
    switch(role) {
    case Id:
        result = mContactList.at(index.row())->getId();
        break;
    case FirstName:
        result = mContactList.at(index.row())->getFirstName();
        break;
    case LastName:
        result = mContactList.at(index.row())->getLastName();
        break;
    case FormatName:
        result = mContactList.at(index.row())->getFormatName();
        break;
    case PhoneNumber:
        result = mContactList.at(index.row())->getPhoneNumber();
        break;
    case Avatar:
        result = mContactList.at(index.row())->getAvatar();
        break;
    case IsFav:
        result = mContactList.at(index.row())->getIsFav();
        break;
    case Section:
        result = mContactList.at(index.row())->getFormatName()[0].toUpper();
        break;
    case IsHeading:
        result = mContactList.at(index.row())->getIsHeading();
        break;
    default:
        break;
    }

    return result;
}

QHash<int, QByteArray> ContactModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Id] = "id";
    roles[FirstName] = "firstname";
    roles[LastName] = "lastname";
    roles[FormatName] = "formatname";
    roles[PhoneNumber] = "number";
    roles[Avatar] = "avatar";
    roles[IsFav] = "favourite";
    roles[Section] = "section";
    roles[IsHeading] = "isHeading";
    return roles;
}

void ContactModel::setContactList(const QVector<ContactInstance*>& list)
{
    if (list.size() > 0)
        mContactList.clear();

    beginResetModel();
    mContactList = list;
    setCount(list.size());
    endResetModel();
}

void ContactModel::appendContact(ContactInstance *contact)
{
    for (auto& item : mContactList)
    {
        if (item->getId() == contact->getId())
            return;
    }

    beginResetModel();
    mContactList.append(contact);
    setCount(++mCount);
    endResetModel();
}

size_t ContactModel::count() const
{
    return mCount;
}

void ContactModel::setCount(size_t newCount)
{
    if (mCount == newCount)
        return;
    mCount = newCount;
    emit countChanged();
}
