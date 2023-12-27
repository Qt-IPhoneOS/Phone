#ifndef HISTORYINSTANCE_H
#define HISTORYINSTANCE_H

#include <QObject>
#include <QDateTime>

class HistoryInstance {
public:
    HistoryInstance();
    HistoryInstance(const uint32_t& id, const QString& formatName, const QString& phoneNumber,
                    const QString& time, const QString& avatar, const int& type);

public:
    void setId(const uint32_t& newId);
    void setFormatName(const QString& newFormatName);
    void setPhoneNumber(const QString& newPhoneNumber);
    void setTime(const QString& newTime);
    void setAvatar(const QString& newAvatar);
    void setType(const int& newType);

    uint32_t getId() const { return mId; }
    QString getFormatName() const { return mFormatName; }
    QString getPhoneNumber() const { return mPhoneNumber; }
    QString getTime() const { return mTime; }
    QString getAvatar() const { return mAvatar; }
    int getType() const { return mType; }

    QDateTime convertToDateTime(const QString&);
    QString getTimeForHistoryPhone(const QString&);

private:
    uint32_t mId {0};
    QString mFormatName {""};
    QString mPhoneNumber {""};
    QString mTime {""};
    int mType {-1};
    QString mAvatar {""};
};

#endif // HISTORYINSTANCE_H
