#!/bin/bash

# invoke macdeploy to add libraries & frameworks to application bundle.
macdeployqt $1 -qmldir=$2 -appstore-compliant

# copy qmltermwidget plugin to application bundle
cp -rvn $3/qmltermwidget/QMLTermWidget $1/Contents/Resources/qml/

# TODO: copy translations...
