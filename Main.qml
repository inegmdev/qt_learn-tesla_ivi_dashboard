import QtQuick
import QtQuick.Window

import "UI/RightScreen"
import "UI/LeftScreen"
import "UI/BottomBar"

Window {
    width: 1200
    height: 720
    visible: true
    title: qsTr("Tesla Infotainment Dashboard")

    RightScreen {
        id: rightScreen
    }

    LeftScreen {
        id: leftScreen
    }

    BottomBar {
        id: bottomBar
    }
}
