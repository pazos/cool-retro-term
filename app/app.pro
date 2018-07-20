QT += qml quick widgets sql

include(../cool-retro-term.pri)

TARGET = cool-retro-term
DESTDIR = $$OUT_PWD/..

HEADERS += \
    fileio.h

SOURCES = \
    main.cpp \
    fileio.cpp

isEmpty(VERSION) {
    VERSION = 1.01
}

DEFINES += CRT_VERSION='\\"$${VERSION}\\"'

macx:ICON = icons/crt.icns
macx:QMAKE_INFO_PLIST = $${CRT_ROOTDIR}/packaging/macos/Info.plist

RESOURCES += qml/resources.qrc

#########################################
##              INTALLS
#########################################

macx {
    QMAKE_POST_LINK += $$escape_expand(\n\t) $$CRT_ROOTDIR/packaging/macos/macdeployqt_helper.sh \
        $${DESTDIR}/$${TARGET}.app $${CRT_QMLDIR} $${DESTDIR}
} else:unix {
    # Icon files
    icon32.files = icons/32x32/cool-retro-term.png
    icon32.path = /usr/share/icons/hicolor/32x32/apps
    icon64.files = icons/64x64/cool-retro-term.png
    icon64.path = /usr/share/icons/hicolor/64x64/apps
    icon128.files = icons/128x128/cool-retro-term.png
    icon128.path = /usr/share/icons/hicolor/128x128/apps
    icon256.files = icons/256x256/cool-retro-term.png
    icon256.path = /usr/share/icons/hicolor/256x256/apps

    # App binary
    target.path += /usr/bin/

    INSTALLS += target icon32 icon64 icon128 icon256
}
