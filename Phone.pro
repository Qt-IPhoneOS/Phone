QT += quick gui core
TEMPLATE = app
TARGET = Phone

INCLUDEPATH += $$PWD/../../MiddlewareLayer \
               $$PWD/../../MiddlewareLayer/Common \
               $$PWD/../UICommon \
               $$PWD/../UICommon/Feature \
               $$PWD/Controller \
               $$PWD/Model \
               $$PWD/../../Services/include
               $$PWD/../../Services/include/Common

SOURCES += \
    Controller/AdapterController.cpp \
    Controller/Common/AbstractController.cpp \
    Controller/Favourite/FavouriteController.cpp \
    Controller/Keypad/KeypadController.cpp \
    Controller/Recent/RecentController.cpp \
    Controller/Contact/ContactController.cpp \
    Controller/PhoneEngine.cpp \
    Model/Common/PhoneInstance.cpp \
    Model/PhoneModel.cpp \
    main.cpp

RESOURCES += \
    Images.qrc \
    Resources.qrc

HEADERS += \
    Commons/CommonDefine.h \
    Controller/AdapterController.h \
    Controller/Common/AbstractController.h \
    Controller/Contact/ContactController.h \
    Controller/Favourite/FavouriteController.h \
    Controller/Keypad/KeypadController.h \
    Controller/Recent/RecentController.h \
    Controller/Common/Enums.h \
    Model/Common/PhoneInstance.h \
    Controller/PhoneEngine.h \
    Model/PhoneModel.h

