#ifndef PHONEMODEL_H
#define PHONEMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "../Common/phoneenums.h"

class PhoneInstance {
public:
    PhoneInstance();
    ~PhoneInstance();

public:
    QString getName() const;
    void setName(const QString& name);

    QString getPhoneNumber() const;
    void setPhoneNumber(const QString& phoneNumber);

    QString getAvatar() const;
    void setAvartar(const QString& avatarResource);

private:
    QString m_sName {""};
    QString m_sPhoneNumber {""};
    QString m_sAvatar {""};
};



class PhoneModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit PhoneModel(QObject* parent = nullptr);
    ~PhoneModel();

public:
    QModelIndex index(int row, int column, const QModelIndex &parent = QModelIndex()) const override;
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;


    enum PhoneInfoID {
        NAME = Qt::UserRole + 1,
        PHONENUMBER,
        AVATAR,
        GENER
    };

    QHash<int,QByteArray> roleNames() const override{
        QHash<int, QByteArray> phoneInfoID;
        phoneInfoID[PhoneInfoID::NAME] = "Name";
        phoneInfoID[PhoneInfoID::GENER] = "Generation";
        phoneInfoID[PhoneInfoID::PHONENUMBER] = "PhoneNumber";
        phoneInfoID[PhoneInfoID::AVATAR] = "Avatar";
        return phoneInfoID;
    }

private:
    QList<PhoneInstance> m_contactList;
};

#endif // PHONEMODEL_H
