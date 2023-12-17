import QtQuick 2.15
import QtQuick.Controls 2.15
import QML.Components
import QML.Constants
import "Common"

Item {
    id: rootItem

    QtObject {
        id: constant

        readonly property int x_title: 25
        readonly property int y_title: 70
        readonly property int width_btn: 140
        readonly property int height_btn: 30
        readonly property int rounded_btn: 4
        readonly property string voice_mail: "Voicemail"
        readonly property string voice_mail_btn: "Call Voicemail"
    }

    Rectangle {
        anchors.fill: parent
        color: UIColors.screen_background
    }

    HeaderTitle {
        id: content
        x: constant.x_title
        y: constant.y_title
        textStr: constant.voice_mail
    }

    Item {
        width: parent.width
        height: parent.height - content.height
        anchors.top: content.bottom

        Rectangle {
            id: button
            width: constant.width_btn
            height: constant.height_btn
            anchors.centerIn: parent
            radius: constant.rounded_btn
            color: UIColors.screen_background
            border.color: mouseArea.pressed ? UIColors.light_grey : UIColors.dark_grey

            CustomText {
                id: text
                fontSize: UIFonts.smallest_pixel
                color: mouseArea.pressed ? UIColors.light_grey : UIColors.dark_grey
                anchors.centerIn: parent
                textStr: constant.voice_mail_btn
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
            }
        }
    }
}
