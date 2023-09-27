#include "PhoneInfo.h"


void ContactInfo::setContactName(const QString &nameContact)
{
    m_sName = nameContact;
}

QString ContactInfo::getNameContact() const
{
    return m_sName;
}

void ContactInfo::setSectionName(const QString &section)
{
    m_sSection = section;
}

QString ContactInfo::getNameSection() const
{
    return m_sSection;
}
