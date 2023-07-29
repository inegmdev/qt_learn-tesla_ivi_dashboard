import QtQuick 2.15

import QtLocation 5.11
import QtPositioning 5.11

Rectangle {
    id: rightScreen

    anchors {
        right: parent.right
        top: parent.top
        bottom: bottomBar.top
    }
    width : parent.width * 2/3


    Plugin {
        id: mapPlugin
        name: "osm"
    }

    Map {
           id: map
           anchors.fill: parent
           plugin: mapPlugin
           center: QtPositioning.coordinate(59.91, 10.75) // Oslo
           zoomLevel: 14
           property geoCoordinate startCentroid

           PinchHandler {
               id: pinch
               target: null
               onActiveChanged: if (active) {
                   map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
               }
               onScaleChanged: (delta) => {
                   map.zoomLevel += Math.log2(delta)
                   map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
               }
               onRotationChanged: (delta) => {
                   map.bearing -= delta
                   map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
               }
               grabPermissions: PointerHandler.TakeOverForbidden
           }
           WheelHandler {
               id: wheel
               // workaround for QTBUG-87646 / QTBUG-112394 / QTBUG-112432:
               // Magic Mouse pretends to be a trackpad but doesn't work with PinchHandler
               // and we don't yet distinguish mice and trackpads on Wayland either
               acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                                ? PointerDevice.Mouse | PointerDevice.TouchPad
                                : PointerDevice.Mouse
               rotationScale: 1/120
               property: "zoomLevel"
           }
           DragHandler {
               id: drag
               target: null
               onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
           }
           Shortcut {
               enabled: map.zoomLevel < map.maximumZoomLevel
               sequence: StandardKey.ZoomIn
               onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
           }
           Shortcut {
               enabled: map.zoomLevel > map.minimumZoomLevel
               sequence: StandardKey.ZoomOut
               onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
           }
       }
    Image {
        id: lockIcon
        anchors {
            left: parent.left
            top: parent.top
            margins: 20
        }
        width: parent.width / 40
        fillMode: Image.PreserveAspectFit
        source: (systemHandler.carLockedStatus ? "qrc:/UI/Assets/Icon-lock-padlock.png" : "qrc:/UI/Assets/Icon-unlock-padlock.png")
        MouseArea {
            anchors.fill: parent
            onClicked: systemHandler.setCarLockedStatus (!systemHandler.carLockedStatus)
        }
    }

    Text {
        id: dateTimeDisplay
        anchors {
            left: lockIcon.right
            leftMargin: 20
            bottom: lockIcon.bottom // Align the date and the lock icon
        }
        font.pixelSize: 14
        font.bold: false
        color: "black"
        text: systemHandler.currentTime
    }

}
