QT += quick gui core
TEMPLATE = app
TARGET = Phone

INCLUDEPATH += $$PWD/../../MiddlewareLayer \
               $$PWD/../../MiddlewareLayer/Common \
               $$PWD/../UICommon \
               $$PWD/../UICommon/Feature \
               $$PWD/Controller \
               $$PWD/../../Services/include
               $$PWD/../../Services/include/Common

SOURCES += \
    Controller/AdapterController.cpp \
    Controller/Controllers/FavouriteController.cpp \
    Controller/Controllers/KeypadController.cpp \
    Controller/Controllers/RecentController.cpp \
    Controller/Controllers/ContactController.cpp \
    Controller/PhoneEngine.cpp \
    PhoneProperties/Common/PhoneInstance.cpp \
    PhoneProperties/PhoneModel.cpp \
    main.cpp

RESOURCES += \
    Images.qrc \
    Resources.qrc

HEADERS += \
    Commons/CommonDefine.h \
    Controller/AdapterController.h \
    Controller/Controllers/ContactController.h \
    Controller/Controllers/FavouriteController.h \
    Controller/Controllers/KeypadController.h \
    Controller/Controllers/Common/PhoneController.h \
    Controller/Controllers/RecentController.h \
    Controller/Enums.h \
    PhoneProperties/Common/PhoneInstance.h \
    Controller/PhoneEngine.h \
    PhoneProperties/PhoneModel.h

