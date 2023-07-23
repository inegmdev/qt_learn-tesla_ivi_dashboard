import QtQuick 2.15

Rectangle {
    id: rightScreen

    anchors {
        right: parent.right
        top: parent.top
        bottom: bottomBar.top
    }
    width : parent.width * 2/3
}
