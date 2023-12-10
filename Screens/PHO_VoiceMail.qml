import QtQuick 2.15
import QtQuick.Controls 2.15
import "Common"
import "JS/def_colors.js" as COLOR
import QML.Components

Item {
    id: rootItem

    QtObject {
        id: constant

        readonly property int horizontalCenterScreen: 70
        readonly property string voiceMail: "Voicemail"
        readonly property string voiceMailBtn: "Call Voicemail"
    }

    Rectangle {
        anchors.fill: parent
        color: "#f0f2f5"
    }

    Item {
        id: content
        width: parent.width - constant.horizontalCenterScreen
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: headerContact
            y: 70
            color: COLOR.blackColor
            font {
                pixelSize: 30
                weight: 600
            }
            text: constant.voiceMail
        }
    }

    Item {
        width: parent.width
        height: parent.height - content.height

        anchors.top: content.bottom
        anchors.topMargin: 0

        Rectangle {
            id: button
            width: 140
            height: 30
            anchors.centerIn: parent
            radius: 4
            color: "#f0f2f5"
            border.color: "#808080"

            Text {
                id: text
                color: "#808080"
                font {
                    pixelSize: 12
                }
                anchors.centerIn: parent
                text: constant.voiceMailBtn
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent

                onPressed: {
                    button.border.color = "#CCCCCC"
                    text.color = "#CCCCCC"
                }

                onReleased: {
                    button.border.color = "#808080"
                    text.color = "#808080"
                }
            }
        }
    }
}
