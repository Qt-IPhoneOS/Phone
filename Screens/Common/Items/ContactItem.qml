import QtQuick 2.15
import QML.Components
import QML.Constants

Item {
    id: root

    QtObject {
        id: constant

        readonly property int item_height: 50
        readonly property int info_width: 25
        readonly property int info_height: 25
    }

    width: parent.width
    height: constant.item_height

    property bool underlineVisible: false
    property bool infoVisible: false
    property string textStr: ""

    Underline {
        width: parent.width
        anchors.top: root.top
    }

    CustomText {
        id: nameContact
        color: UIColors.black
        textStr: root.textStr
        fontWeight: UIFonts.medium_weight
        anchors.verticalCenter: parent.verticalCenter
    }

    Rectangle {
        id: info
        color: UIColors.transparent
        width: constant.info_width
        height: constant.info_height
        border.color: UIColors.blue
        radius: width / 2
        visible: infoVisible
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: UIAligns.margin_20
        }

        CustomText {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: UIColors.blue
            textStr: "i"
            fontFamily: "Courier"
            fontWeight: UIFonts.bold_weight
        }
    }

    Underline {
        width: parent.width
        anchors.top: root.bottom
        visible: underlineVisible
    }
}
