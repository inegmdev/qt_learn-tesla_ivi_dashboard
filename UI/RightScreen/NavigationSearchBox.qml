import QtQuick 2.15

Rectangle {
    id: navSearchBox
    color : "#fbfbfb"
    radius : 7
    width: parent.width / 3
    height: 50

    border {
        color: "#d9d9d9"
        width: 0.5
    }

    Image {
        id: searchBoxIcon
        source : "qrc:/UI/Assets/Icon-Search.png"
        fillMode: Image.PreserveAspectFit
        height: parent.height * 0.35

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: (parent.height - height) / 2
        }

    }

    Text {
        id: searchBoxTextBox
        color: "#a7a7a7"
        visible: (searchBoxTextInput.text === "") // Only show the placeholder when the text input text === ''
        text: "Navigate..."
        anchors {
            left: searchBoxIcon.right
            leftMargin: searchBoxIcon.anchors.leftMargin
            verticalCenter: parent.verticalCenter
        }
    }

    TextInput {
        id: searchBoxTextInput
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            rightMargin: 10
            left: searchBoxIcon.right
            leftMargin: searchBoxIcon.anchors.leftMargin
        }
        verticalAlignment: Text.AlignVCenter
        clip: true
    }
}
