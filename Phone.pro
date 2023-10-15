QT += quick gui core
TEMPLATE = app
TARGET = Phone

SOURCES += \
    AppWindow/AppMain.cpp \
    PhoneController/AdapterController.cpp \
    PhoneController/Controllers/FavouriteController.cpp \
    PhoneController/Controllers/KeypadController.cpp \
    PhoneController/Controllers/RecentController.cpp \
    PhoneController/Controllers/ContactController.cpp \
    PhoneEngine.cpp \
    PhoneProperties/Common/PhoneInstance.cpp \
    PhoneProperties/PhoneModel.cpp \
    main.cpp

RESOURCES += \
    Images.qrc \
    Resources.qrc

HEADERS += \
    AppWindow/AppMain.h \
    Commons/CommonDefine.h \
    PhoneController/AdapterController.h \
    PhoneController/Controllers/ContactController.h \
    PhoneController/Controllers/FavouriteController.h \
    PhoneController/Controllers/KeypadController.h \
    PhoneController/Controllers/Common/PhoneController.h \
    PhoneController/Controllers/RecentController.h \
    PhoneProperties/Common/PhoneInstance.h \
    PhoneEngine.h \
    PhoneProperties/PhoneModel.h

