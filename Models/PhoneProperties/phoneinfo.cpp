#include "phoneinfo.h"


void ContactInfo::setContactName(const QString &nameContact)
{
    m_sName = nameContact;
}

QString ContactInfo::getNameContact() const
{
    return m_sName;
}
