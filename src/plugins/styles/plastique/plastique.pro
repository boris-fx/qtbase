TARGET  = qplastiquestyle
PLUGIN_TYPE = styles
PLUGIN_CLASS_NAME = QPlastiqueStylePlugin
load(qt_plugin)

QT += widgets-private

HEADERS += qplastiquestyle.h
SOURCES += qplastiquestyle.cpp
SOURCES += plugin.cpp

OTHER_FILES += plastique.json
DISTFILES += plastique.json
