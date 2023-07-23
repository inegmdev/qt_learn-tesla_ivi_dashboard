import QtQuick 2.15

Rectangle {
    id: bottomBar
    anchors {
        bottom: parent.bottom
        right: parent.right
        left: parent.left
    }
    height: parent.height / 12
    color: "black"

    Image {
        id: carSettingsIcon
        source: "qrc:/UI/Assets/Icon-Car.png"
        anchors {
            left: parent.left
            leftMargin: 30
            verticalCenter: parent.verticalCenter
        }

        height: parent.height * 0.85
        fillMode: Image.PreserveAspectFit
    }
}
