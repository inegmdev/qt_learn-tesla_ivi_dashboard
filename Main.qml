import QtQuick
import QtQuick.Window

import "UI/BottomBar"

Window {
    width: 1200
    height: 720
    visible: true
    title: qsTr("Tesla Infotainment Dashboard")
    BottomBar {
        id: bottomBar
    }
}
