#include "ContactInstance.h"

ContactInstance::ContactInstance()
{

}

ContactInstance::ContactInstance(const uint32_t &id, const QString &firstName, const QString &lastName, const QString &formatName, const QString &phoneNumber, const QString &photo, const bool &isFav)
{
    mId = id;
    mFirstName = firstName;
    mLastName = lastName;
    mFormatName = formatName;
    mPhoneNumber = phoneNumber;
    mAvatar = photo;
    mIsFav = isFav;
}

void ContactInstance::setId(const uint32_t &newId)
{
    if (mId == newId)
        return;

    mId = newId;
}

void ContactInstance::setFirstName(const QString &newFirstName)
{
    if (mFirstName == newFirstName)
        return;

    mFirstName = newFirstName;
}

void ContactInstance::setLastName(const QString &newLastName)
{
    if (mLastName == newLastName)
        return;

    mLastName = newLastName;
}

void ContactInstance::setFormatName(const QString &newFormatName)
{
    if (mFormatName == newFormatName)
        return;

    mFormatName = newFormatName;
}

void ContactInstance::setPhoneNumber(const QString &newNumber)
{
    if (mPhoneNumber == newNumber)
        return;

    mPhoneNumber = newNumber;
}

void ContactInstance::setAvartar(const QString &newAva)
{
    if (mAvatar == newAva)
        return;

    mAvatar = newAva;
}

void ContactInstance::setIsFav(const bool &newIsFav)
{
    if (mIsFav == newIsFav)
        return;

    mIsFav = newIsFav;
}
