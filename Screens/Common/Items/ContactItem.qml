import QtQuick 2.15
import QML.Components
import QML.Constants

Item {
    id: root

    QtObject {
        id: constant

        readonly property int item_height: 50
    }

    width: parent.width
    height: constant.item_height

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

    InfoButton {
        id: infoBtn
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: UIAligns.margin_30
        }
        visible: infoVisible
    }

    Underline {
        width: parent.width
        anchors.top: root.bottom
    }
}
