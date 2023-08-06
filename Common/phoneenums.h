#ifndef PHONEENUMS_H
#define PHONEENUMS_H

#include <Qt>

namespace uicommon {
    enum class PhoneInfoID {
        NAME = Qt::UserRole + 1,
        PHONENUMBER,
        AVATAR,
        GENER
    };
}

#endif // PHONEENUMS_H
