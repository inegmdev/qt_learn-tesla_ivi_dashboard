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

    HvacComp {
        id: driverHvacControl
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            leftMargin: (leftScreen.width / 2) - (childrenRect.width / 2 + 10)
        }
        hvacTempController: driverHvacHandler
    }

    HvacComp {
        id: passengerHvacControl
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: volCtrlControl.left
            rightMargin: 250
        }
        hvacTempController: passengerHvacHandler
    }

    VolumeCtrlComp {
        id: volCtrlControl
        anchors {
            right: parent.right
            rightMargin: 50
        }
        volCtrlController: volCtrlHandler
    }
}
