import QtQuick
import QtQuick.Window

Window {
    width: 1200
    height: 720
    visible: true
    title: qsTr("Tesla Infotainment Dashboard")
    Rectangle {
        id: bottomBar
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: parent.height / 12
        color : "black"
    }
}
