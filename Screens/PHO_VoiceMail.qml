import QtQuick 2.15
import QtQuick.Controls 2.15
import QML.Components
import QML.Constants
import "Common"

PhoneScreen {
    id: rootItem

    TitleScreen {
        id: content
        x: 25
        y: 70
        textStr: "Voicemail"
    }

    Item {
        width: parent.width
        height: parent.height - content.height
        anchors.top: content.bottom

        Rectangle {
            id: button
            width: 140
            height: 30
            anchors.centerIn: parent
            radius: 4
            color: UIColors.screen_background
            border.color: mouseArea.pressed ? UIColors.light_grey : UIColors.dark_grey

            CustomText {
                id: text
                fontSize: UIFonts.smallest_pixel
                color: mouseArea.pressed ? UIColors.light_grey : UIColors.dark_grey
                anchors.centerIn: parent
                textStr: "Call Voicemail"
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
            }
        }
    }
}
