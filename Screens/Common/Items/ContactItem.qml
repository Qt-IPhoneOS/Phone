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

    property string textStr: ""

    CustomText {
        id: nameContact
        color: UIColors.black
        textStr: root.textStr
        fontWeight: UIFonts.medium_weight
        anchors.verticalCenter: parent.verticalCenter
    }

    Underline {
        width: parent.width
        anchors.top: root.bottom
    }
}
