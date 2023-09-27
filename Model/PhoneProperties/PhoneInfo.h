#ifndef PHONEINFO_H
#define PHONEINFO_H

#include <QObject>

struct ContactInfo {
    QString m_sName;
    QString m_sPhoneNumber;
    QString m_sAvatar;
    QString m_sNoteContent;
    QString m_sSection;

    ContactInfo(QString nameInstance, QString phoneNumber, QString resourceAva, QString noteContent, QString section) {
        m_sName = nameInstance;
        m_sPhoneNumber = phoneNumber;
        m_sAvatar = resourceAva;
        m_sNoteContent = noteContent;
        m_sSection = section;
    } 

    void setContactName(const QString& nameContact);
    QString getNameContact() const;

    void setPhoneNumber(const QString& phoneNumber);
    QString getPhoneNumber() const;

    void setAvatar(const QString& resources);
    QString getAvatar() const;

    void setNoteContent(const QString& noteContent);
    QString getNoteContent() const;

    void setSectionName(const QString& section);
    QString getNameSection() const;
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
