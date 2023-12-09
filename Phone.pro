QT += quick gui core
TEMPLATE = app
TARGET = Phone

LIBS += -L$$PWD/../../Executable \
        -lmiddlewarelayer \
        -luicommon \
        -lservice

INCLUDEPATH += $$PWD/../../MiddlewareLayer \
               $$PWD/../../MiddlewareLayer/Common \
               $$PWD/../UICommon \
               $$PWD/../UICommon/Feature \
               $$PWD/../UICommon/ScreenManager \
               $$PWD/Controller \
               $$PWD/Model \
               $$PWD/../../Services/include
               $$PWD/../../Services/include/Common


SOURCES += \
    Controller/AdapterController.cpp \
    Controller/Favourite/FavouriteController.cpp \
    Controller/Keypad/KeypadController.cpp \
    Controller/Recent/RecentController.cpp \
    Controller/Contact/ContactController.cpp \
    Controller/PhoneEngine.cpp \
    Model/ContactInstance.cpp \
    Model/ContactModel.cpp \
    Model/HistoryInstance.cpp \
    Model/HistoryModel.cpp \
    main.cpp

RESOURCES += \
    Images.qrc \
    Resources.qrc

HEADERS += \
    Controller/AdapterController.h \
    Controller/Common/PhoneDefines.h \
    Controller/Contact/ContactController.h \
    Controller/Favourite/FavouriteController.h \
    Controller/Keypad/KeypadController.h \
    Controller/Recent/RecentController.h \
    Controller/Common/Enums.h \
    Controller/PhoneEngine.h \
    Model/ContactInstance.h \
    Model/ContactModel.h \
    Model/HistoryInstance.h \
    Model/HistoryModel.h

