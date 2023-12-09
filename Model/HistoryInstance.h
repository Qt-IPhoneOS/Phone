#ifndef HISTORYINSTANCE_H
#define HISTORYINSTANCE_H

#include <QObject>

class HistoryInstance {
public:
    HistoryInstance();
    HistoryInstance(const uint32_t& id, const QString& formatName, const QString& phoneNumber,
                    const QString& time, const int& type);

public:
    void setId(const uint32_t& newId);
    void setFormatName(const QString& newFormatName);
    void setPhoneNumber(const QString& newPhoneNumber);
    void setTime(const QString& newTime);
    void setType(const int& newType);

    uint32_t getId() const { return mId; }
    QString getFormatName() const { return mFormatName; }
    QString getPhoneNumber() const { return mPhoneNumber; }
    QString getTime() const { return mTime; }
    int getType() const { return mType; }

private:
    uint32_t mId {0};
    QString mFormatName {""};
    QString mPhoneNumber {""};
    QString mTime {""};
    int mType {-1};
};

#endif // HISTORYINSTANCE_H
