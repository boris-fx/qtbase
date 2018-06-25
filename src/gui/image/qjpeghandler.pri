# common to plugin and built-in forms
HEADERS += $$PWD/qjpeghandler_p.h
SOURCES += $$PWD/qjpeghandler.cpp
contains(QT_CONFIG, system-jpeg) {
	msvc {
       contains( QT_CONFIG, static ): LIBS *= jpeg_s.lib
       contains( QT_CONFIG, shared ): LIBS *= jpeg.lib
    }
    else: \
        LIBS += -ljpeg
} else {
    include($$PWD/../../3rdparty/libjpeg.pri)
}
