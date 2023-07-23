import QtQuick
import QtQuick.Window

import "UI/BottomBar"
import "UI/RightScreen"

Window {
    width: 1200
    height: 720
    visible: true
    title: qsTr("Tesla Infotainment Dashboard")

    RightScreen {
        id: rightScreen
    }

    BottomBar {
        id: bottomBar
    }
}
