#include "phonemodel.h"

PhoneModel::PhoneModel(QObject* parent)
    : QAbstractListModel(parent)
{
    m_contactList.append(PhoneInstance("Vo Dinh Thai", "0963474377", "1", "Male"));
    m_contactList.append(PhoneInstance("Truong Quang Bao", "232424242", "2", "Famale"));
}

PhoneModel::~PhoneModel()
{

}

int PhoneModel::rowCount(const QModelIndex &parent) const
{
    return m_contactList.length();
}

QVariant PhoneModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    const PhoneInstance &instance = m_contactList[index.row()];
    switch (role) {
    case NAME:
        return instance.getName();
    case GENER:
        return instance.getGender();
    case PHONENUMBER:
        return instance.getPhoneNumber();
    case AVATAR:
        return instance.getAvatar();
    default:
        return QVariant();
    }

}

PhoneInstance::PhoneInstance(const QString &name, const QString &phoneNumber, const QString &avatar, const QString &gender)
{
    m_sName = name;
    m_sPhoneNumber = phoneNumber;
    m_sAvatar = avatar;
    m_sGender = gender;
}

PhoneInstance::~PhoneInstance()
{

}

QString PhoneInstance::getName() const
{
    return m_sName;
}

void PhoneInstance::setName(const QString &name)
{
    if (m_sName == name)
        return;
    m_sName = name;
}

QString PhoneInstance::getPhoneNumber() const
{
    return m_sPhoneNumber;
}

void PhoneInstance::setPhoneNumber(const QString &phoneNumber)
{
    if(m_sPhoneNumber == phoneNumber)
        return;
    m_sPhoneNumber = phoneNumber;
}

QString PhoneInstance::getAvatar() const
{
    return m_sAvatar;
}

void PhoneInstance::setAvartar(const QString &avatarResource)
{
    if (m_sAvatar == avatarResource)
        return;
    m_sAvatar = avatarResource;
}

QString PhoneInstance::getGender() const
{
    return m_sGender;
}

void PhoneInstance::setGender(const QString &gender)
{
    if(m_sGender == gender)
        return;
    m_sGender = gender;
}
