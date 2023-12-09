#ifndef CONTACTINSTANCE_H
#define CONTACTINSTANCE_H

#include <QObject>

class ContactInstance {
public:
    ContactInstance();
    ContactInstance(const uint32_t& id, const QString& firstName, const QString& lastName,
                    const QString& formatName, const QString& phoneNumber, const QString& photo, const bool& isFav);

public:
    void setId(const uint32_t& newId);
    void setFirstName(const QString& newFirstName);
    void setLastName(const QString& newLastName);
    void setFormatName(const QString& newFormatName);
    void setPhoneNumber(const QString& newPhoneNumber);
    void setAvartar(const QString& newAva);
    void setIsFav(const bool& newIsFav);

    uint32_t getId() const { return mId; }
    QString getFirstName() const { return mFirstName; }
    QString getLastName() const { return mLastName; }
    QString getFormatName() const { return mFormatName; }
    QString getPhoneNumber() const { return mPhoneNumber; }
    QString getAvatar() const { return mAvatar; }
    bool getIsFav() const { return mIsFav; }

private:
    uint32_t mId {0};
    QString mFirstName {""};
    QString mLastName {""};
    QString mFormatName {""};
    QString mPhoneNumber {""};
    QString mAvatar {""};
    bool mIsFav {false};
};


#endif // CONTACTINSTANCE_H
