contains(QT_CONFIG, system-png) {
    unix|mingw: LIBS_PRIVATE += -lpng
    else: win32 {
       contains( QT_CONFIG, static ): LIBS *= png_s.lib zlib1_s.lib
       contains( QT_CONFIG, shared ): LIBS *= png.lib
    }
    else: LIBS += libpng.lib
} else: contains(QT_CONFIG, png) {
    include($$PWD/libpng.pri)
}
