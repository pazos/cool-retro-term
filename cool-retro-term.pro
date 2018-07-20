TEMPLATE = subdirs

CONFIG += ordered

include(cool-retro-term.pri)

SUBDIRS += qmltermwidget
SUBDIRS += app

macx {

} else:unix {
    desktop.files += cool-retro-term.desktop
    desktop.path += /usr/share/applications

    INSTALLS += desktop
}
