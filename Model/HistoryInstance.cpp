#include "HistoryInstance.h"

HistoryInstance::HistoryInstance()
{

}

HistoryInstance::HistoryInstance(const uint32_t &id, const QString &formatName, const QString &phoneNumber, const QString &time, const int &type)
{
    mId = id;
    mFormatName = formatName;
    mPhoneNumber = phoneNumber;
    mTime = time;
    mType = type;
}



void HistoryInstance::setId(const uint32_t &newId)
{
    if (mId == newId)
        return;

    mId = newId;
}

void HistoryInstance::setFormatName(const QString &newFormatName)
{
    if (mFormatName == newFormatName)
        return;

    mFormatName = newFormatName;
}

void HistoryInstance::setPhoneNumber(const QString &newNumber)
{
    if (mPhoneNumber == newNumber)
        return;

    mPhoneNumber = newNumber;
}

void HistoryInstance::setTime(const QString &newTime)
{
    if (mTime == newTime)
        return;

    mTime = newTime;
}

void HistoryInstance::setType(const int &newType)
{
    if (mType == newType)
        return;

    mType = newType;
}
