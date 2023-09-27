QT += quick gui core
TEMPLATE = app

TARGET = Phone

SOURCES += \
    AppWindow/AppMain.cpp \
    Model/ContactModel.cpp \
    Model/PhoneProperties/PhoneInfo.cpp \
    Controller/ContactController.cpp \
    PhoneEngine.cpp \
    main.cpp

RESOURCES += \
    Images.qrc \
    Resources.qrc

HEADERS += \
    AppWindow/AppMain.h \
    Controller/ContactController.h \
    Model/ContactModel.h \
    Model/PhoneProperties/PhoneInfo.h \
    PhoneEngine.h
