import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QML.Components
import QML.Constants

Rectangle {
    id: root
    width: constant.keypad_width
    height: constant.keypad_height
    color: mouseArea.pressed ? UIColors.light_grey : UIColors.greyish
    radius: width / 2

    property string number: ""
    property string desc: ""

    signal keypadClicked(var value)

    QtObject {
        id: constant

        readonly property int keypad_width: 90
        readonly property int keypad_height: 90

        readonly property int align_value: 25
        readonly property int number_size: 35
        readonly property int desc_y: 45

        readonly property int special_pixel: 40
    }

    Item {
        width: parent.width
        height: parent.height - constant.align_value
        anchors.centerIn: parent
        visible: root.number !== ""

        CustomText {
            id: number
            text: root.number
            width: parent.width
            visible: root.number !== ""
            horizontalAlignment: Text.AlignHCenter
            color: UIColors.black
            fontSize: constant.number_size
        }

        CustomText {
            id: description
            text: root.desc
            width: parent.width
            y: constant.desc_y
            horizontalAlignment: Text.AlignHCenter
            color: UIColors.black
            fontSize: root.number === "" ? UIFonts.biggest_pixel : UIFonts.smallest_pixel
            fontWeight: UIFonts.medium_weight
        }
    }

    Item {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        visible: root.number === ""

        CustomText {
            text: root.desc
            anchors.centerIn: parent
            color: UIColors.black
            fontSize: UIFonts.biggest_pixel
            fontWeight: UIFonts.medium_weight
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onClicked: {
            keypadClicked(root.number !== "" ? root.number : root.desc)
        }
    }
}
