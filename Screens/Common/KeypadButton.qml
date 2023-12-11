import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../JS/def_colors.js" as COLOR
import QML.Components

Rectangle {
    id: root
    width: 90
    height: 90
    color: "#DDDDDD"
    radius: width / 2

    property string number: ""
    property string desc: ""

    signal keypadClicked(var value)

    MouseArea {
        anchors.fill: parent

        onPressed: {
            keypadClicked(root.number !== "" ? root.number : root.desc)
            root.color = "#CCCCCC"
        }

        onReleased: {
            root.color = "#DDDDDD"
        }
    }

    Item {
        width: parent.width
        height: parent.height - 25
        anchors.centerIn: parent
        visible: root.number !== ""

        Text {
            id: number
            text: root.number
            width: parent.width
            visible: root.number !== ""
            horizontalAlignment: Text.AlignHCenter
            color: COLOR.blackColor
            font {
                pixelSize: 35
                weight: 300
            }
        }

        Text {
            id: number2
            text: root.desc
            width: parent.width
            y: 45
            horizontalAlignment: Text.AlignHCenter
            color: COLOR.blackColor
            font {
                pixelSize: root.number === "" ? 30 : (root.number === "0" ? 15 : 12)
                weight: 400
            }
        }
    }

    Item {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        visible: root.number === ""

        Text {
            text: root.desc
            anchors.centerIn: parent
            color: COLOR.blackColor
            font {
                pixelSize: 30
                weight: 400
            }
        }
    }
}
