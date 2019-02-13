TARGET  = qplastiquestyle
PLUGIN_TYPE = styles
load(qt_plugin)

QT += widgets-private

HEADERS += qplastiquestyle.h
SOURCES += qplastiquestyle.cpp
SOURCES += plugin.cpp

OTHER_FILES += plastique.json
