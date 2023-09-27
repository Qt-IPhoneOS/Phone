#include "ContactModel.h"
#include <QDebug>

ContactModel::ContactModel(QObject* parent)
    : QAbstractListModel(parent)
{
    mContact.append(ContactInfo("Thai","0963474377", "qrc:/Screen/Images/icons8-star-50.png", "Thai Dep Trai", "A"));
    mContact.append(ContactInfo("Thai","0963474377", "qrc:/Screen/Images/icons8-star-50.png", "Thai Dep Trai", "A"));
    mContact.append(ContactInfo("Thai","0963474377", "qrc:/Screen/Images/icons8-star-50.png", "Thai Dep Trai", "B"));
}

ContactModel::~ContactModel()
{

}

int ContactModel::rowCount(const QModelIndex &parent) const
{
    return mContact.length();
}

QVariant ContactModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    const ContactInfo &item = mContact[index.row()];
    switch (role) {
    case ContactRole::NameContact:
        return item.getNameContact();
        break;
    case ContactRole::PhoneNumber:
        break;
    case ContactRole::Avartar:
        break;
    case ContactRole::Notes:
        break;
    case ContactRole::Section:
        return item.getNameSection();
        break;
    default:
        return QVariant();
        break;
    }
}
