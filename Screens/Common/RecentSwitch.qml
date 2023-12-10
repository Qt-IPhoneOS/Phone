import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: switchContainer
    width: 150
    height: 32
    color: "transparent"
    property bool switchOn: false

    signal switchClicked()

    Rectangle {
        width: parent.width
        height: parent.height
        radius: 7
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        clip: true
        color: "#E5E5E5"

        Item {
            id: allText
            width: parent.width / 2
            height: parent.height
            z: 1
            Text {
                anchors.centerIn: allText
                font.pixelSize: 12
                text: "All"
            }
        }

        Item {
            id: missedText
            width: parent.width / 2
            height: parent.height
            x: parent.width / 2
            z: 1
            Text {
                anchors.centerIn: missedText
                font.pixelSize: 12
                text: "Missed"
            }
        }

        Rectangle {
            width: parent.width / 2 - 2
            height: parent.height - 2
            radius: 7
            color: "white"
            border.color: "#E5E5E5"
            z: 0
            anchors.verticalCenter: parent.verticalCenter
            x: switchContainer.switchOn ? parent.width - width - 2 : 2
            Behavior on x {
                NumberAnimation { duration: 200 }
            }
        }

        MouseArea {
            id: switchArea
            width: parent.width
            height: parent.height
            onClicked: switchContainer.switchClicked()
        }
    }
}



