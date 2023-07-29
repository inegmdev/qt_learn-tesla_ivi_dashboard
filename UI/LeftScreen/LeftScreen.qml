import QtQuick 2.15

Rectangle {
    id: leftScreen
    anchors {
        top: parent.top
        left: parent.left
        bottom: bottomBar.top
        right: rightScreen.left
    }

    color: "#fbfbfb"

    Image {
        id: imgCar
        source: "qrc:/UI/Assets/Car.png"
        fillMode: Image.PreserveAspectFit
        width: parent.width * 0.75
        anchors.centerIn: parent
    }
}
