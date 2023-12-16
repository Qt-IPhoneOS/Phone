import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "Common"
import QML.Constants
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

    Text {
        width: parent.width
        y: 110
        horizontalAlignment: Text.AlignHCenter
        visible: KeypadController.numberSelected !== ""
        text: KeypadController.numberSelected
        color: UIColors.black
        font {
            pixelSize: 30
            weight: 400
        }
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
                model: ListModel {
                    ListElement {
                        number: "1"
                        desc: ""
                    }
                    ListElement {
                        number: "2"
                        desc: "A B C"
                    }
                    ListElement {
                        number: "3"
                        desc: "D E F"
                    }
                    ListElement {
                        number: "4"
                        desc: "G H I"
                    }
                    ListElement {
                        number: "5"
                        desc: "J K L"
                    }
                    ListElement {
                        number: "6"
                        desc: "M N O"
                    }
                    ListElement {
                        number: "7"
                        desc: "P Q R S"
                    }
                    ListElement {
                        number: "8"
                        desc: "T U V"
                    }
                    ListElement {
                        number: "9"
                        desc: "W X Y Z"
                    }
                    ListElement {
                        number: ""
                        desc: "*"
                    }
                    ListElement {
                        number: "0"
                        desc: "+"
                    }
                    ListElement {
                        number: ""
                        desc: "#"
                    }
                }
                KeypadButton {
                    id: button
                    number: model.number
                    desc: model.desc

                    Connections {
                        target: button

                        function onKeypadClicked(value) {
                            KeypadController.numberSelected += value
                        }
                    }
                }
            }
        }

        Image {
            id: userImage
            width: 90
            height: 90
            anchors.top: gridView.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter

            source: "qrc:/Assets/phone_call.png"
        }
    }


}
