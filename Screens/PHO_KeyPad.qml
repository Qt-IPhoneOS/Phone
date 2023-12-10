import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "Common"
import "JS/def_colors.js" as COLOR
import QML.Components

Item {
    id: rootItem

    QtObject {
        id: constant

    }

    Rectangle {
        anchors.fill: parent
        color: "#f0f2f5"
        z: 0
    }

    Item {
        y: 100
        width: parent.width
        height: parent.height - 100
        z: 1

        GridLayout {
            id: gridView
            width: parent.width - 200
            columns: 3
            rows: 4
            anchors.centerIn: parent
            columnSpacing: 55
            rowSpacing: 20

            Repeater {
                model: 12
//                Button {
//                    text: (index + 1).toString()
//                    width: 25
//                    height: 25
//                    font.pixelSize: 20
//                    onClicked: {
//                        console.log("Pressed:", text);
//                    }
//                }

                Rectangle {
                    width: 90
                    height: 90
                    color: "#CCCCCC"
                    radius: width / 2
                }
            }
        }

        Rectangle {
            width: 90
            height: 90
            color: "#CCCCCC"
            radius: width / 2
            anchors.top: gridView.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }


}
