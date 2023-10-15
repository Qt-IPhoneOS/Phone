import QtQuick 2.15

Rectangle {
    id: rootItem
    property string sourceNormal: ""
    property string sourcePressed: ""

    property int buttonWidth: 75
    property int buttonHeight: 25

    property int iconWidth: 25
    property int iconHeight: 25

    property string titleIcon: ""
    property string textColor: "#7F7F81"

    width: rootItem.buttonWidth
    height: rootItem.buttonHeight

    property bool isActive: false
    signal transferScreen()

    Image {
        id: iconImage
        width: titleIcon.visible ? rootItem.iconWidth : rootItem.buttonWidth
        height: titleIcon.visible ? rootItem.iconHeight : rootItem.buttonWidth
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: rootItem.sourceNormal
        states: [
            State {
                name: "pressed"
                when: rootItem.isActive
                PropertyChanges {
                    target: iconImage
                    source: rootItem.sourcePressed
                }
                PropertyChanges {
                    target: titleIcon
                    color: "#0D7FFA"
                }
            }
        ]
    }

    MouseArea {
        id: iconMouse
        anchors.fill: parent
        onReleased: {
            rootItem.isActive = !rootItem.isActive
            rootItem.transferScreen()
        }
    }

    Text {
        id: titleIcon
        visible: rootItem.titleIcon === "" ? false : true
        text: rootItem.titleIcon
        color: rootItem.textColor
        font.pixelSize: 10
        clip: true
        anchors {
            top: iconImage.bottom
            horizontalCenter: iconImage.horizontalCenter
        }
    }
}
