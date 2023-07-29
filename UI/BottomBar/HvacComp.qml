import QtQuick 2.15

Item {
    property var uiConfig : {
        "fontColor" : "#8e8e8e",
        "arrowBgColor" : "black",
        "arrowFontSize" : 18,
        "inBetweenSpaces" : 7
    }

    property var hvacTempController

    Rectangle {
        id: decrementBtn
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        width: height / 2
        color: uiConfig.arrowBgColor
        Text {
            id: decrementBtnTxt
            anchors.centerIn: parent
            text: "◄"
            font.pixelSize: uiConfig.arrowFontSize
            font.bold: true
            color: uiConfig.fontColor
        }
        MouseArea {
            anchors.fill: parent
            onClicked: hvacTempController.changeTargetTemp ( -1 )
        }
    }
    Text {
        id: carTemperatureTxt
        anchors {
            left: decrementBtn.right
            leftMargin: uiConfig.inBetweenSpaces
            verticalCenter: parent.verticalCenter
        }
        color: uiConfig.fontColor
        font {
            pixelSize: 24
        }
        text : hvacTempController.targetTemp
    }

    Rectangle {
        id: incrementBtn
        anchors {
            left: carTemperatureTxt.right
            leftMargin: carTemperatureTxt.anchors.leftMargin
            top: parent.top
            bottom: parent.bottom
        }
        width: height / 2
        color: uiConfig.arrowBgColor
        Text {
            id: incrementBtnTxt
            anchors.centerIn: parent
            text: "►"
            font.pixelSize: uiConfig.arrowFontSize
            font.bold: true
            color: uiConfig.fontColor
        }
        MouseArea {
            anchors.fill: parent
            onClicked: hvacTempController.changeTargetTemp ( +1 )
        }
    }
}
