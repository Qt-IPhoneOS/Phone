import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: rootItem
    color: "#F5F5F5"
    property bool isActive: true
    property var listIconFooterNormal: [
        "qrc:/Assets/keypad_nonactive.png",
        "qrc:/Assets/plus_icon.png",
        "qrc:/Assets/user_image.jpg",
        "qrc:/Assets/keypad_active.png"
    ]

    property var listIconFooterActive: [
        "qrc:/Assets/keypad_active.png",
        "qrc:/Assets/back_arrow_icon.png",
        "qrc:/Assets/keypad_nonactive.png",
        "qrc:/Assets/plus_icon.png "
    ]

    MouseArea {
        anchors.fill: parent
        onClicked: {
            rootItem.isActive = !rootItem.isActive
        }
    }

    Repeater {
        id: repeaterFooter
        model: 3
        delegate: comDeleFooterPhone
    }

    Component {
        id: comDeleFooterPhone
        Item {
            width: 50
            height: 50

            Image {
                id: iconImages
                source: ""
            }

            states: [
                State {
                    name: "normal"
                    when: rootItem.isActive
                    PropertyChanges {
                        target: iconImages
                        source: rootItem.listIconFooterNormal[index]
                    }
                },
                State {
                    name: "active"
                    when: !rootItem.isActive
                    PropertyChanges {
                        target: iconImages
                        source: rootItem.listIconFooterActive[index]
                    }
                }

            ]
        }
    }
}
