import QtQuick 2.15
import QML.Components
import QML.Constants

Item {
    id: rootItem

    width: rootItem.buttonWidth
    height: rootItem.buttonHeight

    property bool isActive: false
    property int buttonWidth: 75
    property int buttonHeight: 25
    property int iconWidth: 30
    property int iconHeight: 30
    property string titleIcon: ""
    property string sourceIcon: ""

    signal transferScreen()

    Image {
        id: iconImage
        width: titleIcon.visible ? rootItem.iconWidth : rootItem.buttonWidth
        height: titleIcon.visible ? rootItem.iconHeight : rootItem.buttonWidth
        y: 7
        anchors.horizontalCenter: parent.horizontalCenter
        source: rootItem.sourceIcon
    }

    CustomText {
        id: titleIcon
        visible: !(rootItem.titleIcon === "")
        text: rootItem.titleIcon
        color: rootItem.isActive ? UIColors.blue : UIColors.grey
        fontSize: 10
        anchors.top: iconImage.bottom
        anchors.topMargin: 3
        clip: true
        anchors {
            top: iconImage.bottom
            horizontalCenter: iconImage.horizontalCenter
        }
    }

    MouseArea {
        id: iconMouse
        anchors.fill: parent
        onReleased: {
            rootItem.transferScreen()
        }
    }
}
