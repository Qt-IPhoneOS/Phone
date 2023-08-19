import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 700
    height: 700
    Rectangle {
        anchors.fill: parent
        color: "blue"
    }

    ListModel {
        id: myModel
        ListElement { text: "1" ; color: "red" }
        ListElement { text: "2" ; color: "blue" }
        ListElement { text: "3" ; color: "yellow" }
        ListElement { text: "4" ; color: "gray" }
    }

    ListView {
        id: myViewer
        model: myModel
        width: parent
        height: 100
        orientation: Qt.LeftToRight
        delegate: Component {
            Rectangle {
                width: 50
                height: 50
                color: model.color
                Text {
                    anchors.centerIn: parent
                    text: model.text
                }
            }
        }
    }
}
