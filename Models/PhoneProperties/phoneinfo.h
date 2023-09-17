#ifndef PHONEINFO_H
#define PHONEINFO_H

#include <QObject>
#include "../../Common/phoneenums.h"

struct ContactInfo {
    QString m_sName;
    QString m_sPhoneNumber;
    QString m_sAvatar;
    QString m_sNoteContent;

    ContactInfo(QString nameInstance, QString phoneNumber, QString resourceAva, QString noteContent) {
        m_sName = nameInstance;
        m_sPhoneNumber = phoneNumber;
        m_sAvatar = resourceAva;
        m_sNoteContent = noteContent;
    } 

    void setContactName(const QString& nameContact);
    QString getNameContact() const;

    void setPhoneNumber(const QString& phoneNumber);
    QString getPhoneNumber() const;

    void setAvatar(const QString& resources);
    QString getAvatar() const;

    void setNoteContent(const QString& noteContent);
    QString getNoteContent() const;
};

struct HistoryInfo {

};

struct FavouritesInfo {

};

class PhoneInstance {
public:
    PhoneInstance(const QString& name, const QString& phoneNumber, const QString& avatar, const QString& gender);
    ~PhoneInstance();

public:
    QString getName() const;
    void setName(const QString& name);

    QString getPhoneNumber() const;
    void setPhoneNumber(const QString& phoneNumber);

    QString getAvatar() const;
    void setAvartar(const QString& avatarResource);

    QString getGender() const;
    void setGender(const QString& gender);

private:
    QString m_sName {""};
    QString m_sPhoneNumber {""};
    QString m_sAvatar {""};
    QString m_sGender {""};
};

#endif // PHONEINFO_H
