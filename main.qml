import QtQuick 2.15
import QtQuick.Window 2.15

import "UI/RightScreen"
import "UI/LeftScreen"
import "UI/BottomBar"

Window {
    width: 1280
    height: 720
    visible: true
    title: qsTr("Tesla Infotainment")

    LeftScreen {
        id: leftScreen
    }

    RightScreen {
        id: rightScreen
    }

    BottomBar {
        id: bottomBar
    }
}
