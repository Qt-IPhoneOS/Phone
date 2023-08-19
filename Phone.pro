QT += quick gui core
TEMPLATE = app

TARGET = Phone

SOURCES += \
    Common/phoneenums.cpp \
    Models/phonemodel.cpp \
    main.cpp \
    phoneengine.cpp

RESOURCES += \
    Resources.qrc

HEADERS += \
    Common/phoneenums.h \
    Models/phonemodel.h \
    phoneengine.h
