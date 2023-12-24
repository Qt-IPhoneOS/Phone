import QtQuick 2.15
import QtQuick.Controls 2.15
import QML.Constants
import QML.Components

Rectangle {
    id: rootItem
    width: 150
    height: 32
    color: "transparent"
    property bool switchOn: false

    signal requestAll()
    signal requestMissed()

    Rectangle {
        width: parent.width
        height: parent.height
        radius: 7
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        clip: true
        color: UIColors.greyish

        Item {
            id: allText
            z: 1
            width: parent.width / 2
            height: parent.height
            CustomText {
                anchors.centerIn: allText
                fontSize: 12
                textStr: "All"
            }

            MouseArea {
                width: parent.width
                height: parent.height
                onClicked: rootItem.requestAll()
            }
        }

        Item {
            id: missedText
            x: parent.width / 2
            z: 1
            width: parent.width / 2
            height: parent.height
            CustomText {
                anchors.centerIn: missedText
                fontSize: 12
                textStr: "Missed"
            }

            MouseArea {
                width: parent.width
                height: parent.height
                onClicked: rootItem.requestMissed()
            }
        }

        Rectangle {
            width: parent.width / 2 - 2
            height: parent.height - 2
            radius: 7
            color: UIColors.white
            border.color: UIColors.greyish
            anchors.verticalCenter: parent.verticalCenter
            x: rootItem.switchOn ? parent.width - width - 2 : 2
            Behavior on x {
                NumberAnimation { duration: 200 }
            }
        }


    }
}



