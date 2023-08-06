#include "phonemodel.h"

PhoneModel::PhoneModel(QObject* parent)
    : QAbstractListModel(parent)
{

}

PhoneModel::~PhoneModel()
{

}

QModelIndex PhoneModel::index(int row, int column, const QModelIndex &parent) const
{

}

int PhoneModel::rowCount(const QModelIndex &parent) const
{

}

QVariant PhoneModel::data(const QModelIndex &index, int role) const
{

}

PhoneInstance::~PhoneInstance()
{

}

QString PhoneInstance::getName() const
{

}

void PhoneInstance::setName(const QString &name)
{

}

QString PhoneInstance::getPhoneNumber() const
{

}

void PhoneInstance::setPhoneNumber(const QString &phoneNumber)
{

}

QString PhoneInstance::getAvatar() const
{

}

void PhoneInstance::setAvartar(const QString &avatarResource)
{

}
