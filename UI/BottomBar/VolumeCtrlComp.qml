import QtQuick 2.15

Item {
    property var uiConfig : {
        "fontColor" : "#8e8e8e",
        "arrowBgColor" : "black",
        "arrowFontSize" : 18,
        "inBetweenSpaces" : 7
    }

    property var volCtrlController

    anchors {
        top: parent.top
        bottom: parent.bottom
    }

    Rectangle {
        id: decreaseVolBtn
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: volIcon.left
            rightMargin: uiConfig.inBetweenSpaces
        }

        width: height / 2

        color: uiConfig.arrowBgColor

        Text {
            color: uiConfig.fontColor
            text: "◄"
            anchors.centerIn: parent
            font.pixelSize: uiConfig.arrowFontSize
        }

        MouseArea {
            anchors.fill: parent
            onClicked: volCtrlController.changeVolumeLevel(-30)
        }
    }

    Image {
        id: volIcon
        source: {
            if (volCtrlController.volumeLevel === 0 ) {
                return "qrc:/UI/Assets/Icons/Audio-Lvs/Icon-Audio-Lv0-Mute.png"
            } else if (volCtrlController.volumeLevel > 0 && volCtrlController.volumeLevel < 50) {
                return "qrc:/UI/Assets/Icons/Audio-Lvs/Icon-Audio-Lv1.png"
            } else if (volCtrlController.volumeLevel >= 50 && volCtrlController.volumeLevel < 100) {
                return "qrc:/UI/Assets/Icons/Audio-Lvs/Icon-Audio-Lv2.png"
            } else if (volCtrlController.volumeLevel === 100) {
                return "qrc:/UI/Assets/Icons/Audio-Lvs/Icon-Audio-Lv3-Max.png"
            } else {
                /* Should not happen */
            }
        }
        height: parent.height / 2
        fillMode: Image.PreserveAspectFit
        anchors {
            right: increaseVolBtn.left
            rightMargin: uiConfig.inBetweenSpaces
            verticalCenter: parent.verticalCenter
        }

        MouseArea {
            anchors.fill: parent
            onClicked: volCtrlController.toggleMute()
        }
    }

    Rectangle {
        id: increaseVolBtn
        anchors {
            top: parent.top
            bottom: parent.bottom
        }
        width: height / 2

        color: uiConfig.arrowBgColor

        Text {
            color: uiConfig.fontColor
            text: "►"
            anchors.centerIn: parent
            font.pixelSize: uiConfig.arrowFontSize
        }

        MouseArea {
            anchors.fill: parent
            onClicked: volCtrlController.changeVolumeLevel(+30)
        }
    }

}
