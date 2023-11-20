#ifndef PHONEINSTANCE_H
#define PHONEINSTANCE_H

#include <QObject>
#include <QTime>
#include <QDateTime>

const QString ContactList[] = {
    "name=ThaiVoDinh phoneNumber=0963474377 national=VietNam typeContact=family",
    "name=QuocVoDinh phoneNumber=0963474377 national=VietNam typeContact=family",
    "name=BaoQuangTruong phoneNumber=0963474377 national=VietNam typeContact=friend",
    "name=NguyenTruongDinhThanh phoneNumber=0963474377 national=VietNam typeContact=friend"
};

enum class PHONE_STATE {
    UNACTIVE = 0,
    ACTIVE,
    CALLING,
    INCALLING,
    OUTCALLING,
};

/* Instance for Contacts */
class PhoneInfor {

public:
    PhoneInfor() {}
    PhoneInfor(QString _name, QString _phone, QString _avatar, QString _notes)
        : mName(_name)
        , mPhoneNumber(_phone)
        , mAvatar(_avatar)
        , mNotes(_notes)
    {

    }

public:
    void setName(const QString _name) { mName = _name; }
    QString getname() const { return mName; }
    void setPhoneNumber(const QString _number) { mPhoneNumber = _number; }
    QString getPhoneNumber() const { return mPhoneNumber; }
    void setAvartar(const QString _avatar) { mAvatar = _avatar; }
    QString getAvatar() const { return mAvatar; }
    void setNotes(const QString _notes) { mNotes = _notes; }
    QString getNotes() const { return mNotes; }

private:
    QString mName {""};
    QString mPhoneNumber {""};
    QString mAvatar {""};
    QString mNotes {""};
};

class ContactInfo : public PhoneInfor {
public:
    ContactInfo(QString _name, QString _phone, QString _avatar, QString _notes)
        : PhoneInfor(_name, _phone, _avatar, _notes)
    {

    }
    ~ContactInfo();
private:
    QString mNameOfGroup {""};
};

class RecentInfor : public PhoneInfor {
public:
    struct DateOfTime {

    };

public:
    RecentInfor();

private:
    QString typeCalling;
    QString timeDuration;
};

class FavouriteInfor : public PhoneInfor {

};

#endif // PHONEINSTANCE_H
