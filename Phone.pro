QT += quick gui core
TEMPLATE = app

TARGET = Phone

SOURCES += \
    Common/phoneenums.cpp \
    Controllers/phonecontroller.cpp \
    Models/PhoneProperties/phoneinfo.cpp \
    Models/contactlistmodel.cpp \
    main.cpp \
    phoneengine.cpp

RESOURCES += \
    Resources.qrc

HEADERS += \
    Common/phoneenums.h \
    Controllers/phonecontroller.h \
    Models/PhoneProperties/phoneinfo.h \
    Models/contactlistmodel.h \
    phoneengine.h
