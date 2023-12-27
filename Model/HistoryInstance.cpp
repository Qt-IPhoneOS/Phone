#include "HistoryInstance.h"

#define LimitedToDisplayDate 7

HistoryInstance::HistoryInstance()
{

}

HistoryInstance::HistoryInstance(const uint32_t &id, const QString &formatName, const QString &phoneNumber, const QString &time, const QString& avatar, const int &type)
{
    mId = id;
    mFormatName = formatName;
    mPhoneNumber = phoneNumber;
    mTime = getTimeForHistoryPhone(time);
    mAvatar = avatar;
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

void HistoryInstance::setAvatar(const QString &newAvatar)
{
    if (mAvatar == newAvatar)
        return;

    mAvatar = newAvatar;
}

void HistoryInstance::setType(const int &newType)
{
    if (mType == newType)
        return;

    mType = newType;
}


QDateTime HistoryInstance::convertToDateTime(const QString& dateTime){
    QDateTime valDateTime;
    if (dateTime.size() != 14){
        // invalid time
        valDateTime = QDateTime(QDate(2021,12,6),QTime(0,0));
    }
    else {
        valDateTime = QDateTime(QDate(dateTime.left(4).toInt(),dateTime.mid(4,2).toInt(),dateTime.mid(6,2).toInt())
                                ,QTime(dateTime.mid(8,2).toInt(),dateTime.mid(10,2).toInt(),dateTime.mid(12,2).toInt()));
    }
    return valDateTime;
}

QString HistoryInstance::getTimeForHistoryPhone(const QString &timeOfPhone)
{
    QDateTime currentDateTime = QDateTime::currentDateTime();
    QDate currentDate = currentDateTime.date();

    QDateTime dateTimePhone = convertToDateTime(timeOfPhone);
    QDate datePhone = dateTimePhone.date();
    QTime timePhone = dateTimePhone.time();

    if (currentDate.year() < datePhone.year())
    {
        // invalid case
        return "--/--/--";
    }
    else if (currentDate.year() == datePhone.year())
    {
        if (currentDate.month() < datePhone.month())
        {
            // invalid case
            return "--/--/--";
        }
        else if (currentDate.month() == datePhone.month())
        {
            if (currentDate.day() < datePhone.day())
            {
                // invalid case
                return "--/--/--";
            }
            else if (currentDate.day() == datePhone.day())
            {
                return timePhone.toString("hh:mm");
            }
            else if (currentDate.day() - datePhone.day() < LimitedToDisplayDate)
            {
                return datePhone.toString("dddd");
            }
            else
            {
                return datePhone.toString("dd/MM/yyyy");
            }
        }
        else
        {
            return datePhone.toString("dd/MM/yyyy");
        }
    }
    else
    {
        return datePhone.toString("dd/MM/yyyy");
    }
}
