#include "PhoneModel.h"
#include <QDebug>

PhoneModel::PhoneModel(QObject* parent)
    : QAbstractListModel(parent)
{
    mContact.append(ContactInfo("Vo Dinh Thai", "0963474377", "qrc:/Screen/Images/icons8-star-50.png", "Call me now"));
    mContact.append(ContactInfo("Vo Dinh Quoc", "0963474377", "qrc:/Screen/Images/icons8-star-50.png", "Call me later"));
    mContact.append(ContactInfo("Truong Quang Bao","0963474377", "qrc:/Screen/Images/icons8-star-50.png", "Call me later"));
}

PhoneModel::~PhoneModel()
{

}

int PhoneModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return mContact.length();
}

QVariant PhoneModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    const ContactInfo &item = mContact[index.row()];
    switch (role) {
    case ContactRole::Name:
        return item.getname();
        break;
    case ContactRole::PhoneNumber:
        break;
    case ContactRole::Avartar:
        break;
    case ContactRole::Notes:
        break;
    case ContactRole::Section:
//        return item.getNameSection();
        break;
    default:
        return QVariant();
        break;
    }
}
