import QtQuick 2.15
import QtQuick.Controls 2.15
import "../UICommon"

Item {
    id: rootItem
    width: 428
    height: 926
    Rectangle {
        anchors.fill: parent
        color: "#000000"
    }

    Item {
        id: headerTab
        width: parent.width
        height: 28
        anchors {
            top: parent.top
            topMargin: 100
        }

        Rectangle {
            id: backButton
            height: parent.height
            width: 100
            color: "transparent"
            opacity: backMouse.pressed ? 0.5 : 1
            Image {
                id: backIcon
                width: 30
                height: parent.height
                source: "qrc:/RESOURCES/Images/back_arrow_icon.png"
            }
            Text {
                height: parent.height
                x: 35
                width: 30
                anchors {
                    top: parent.top
                    topMargin: 2
                }
                color: "#1A39B4"
                text: "Lists"
                font.pixelSize: 21
            }
            MouseArea {
                id: backMouse
                anchors.fill: parent
                onClicked: {
                    // Back to previous screen
                }
            }
        }

        Image {
            id: plusIcon
            source: "qrc:/RESOURCES/Images/plus_icon.png"
            height: parent.height
            width: 30
            anchors.right: parent.right
        }

    }

    Text {
        id: headerContact
        width: 100
        height: 50
        x: 10
        y: 150
        color: "#FEFEFE"
        font {
            pixelSize: 30
            weight: 30
        }
        text: "Contacts"
    }

    Rectangle {
        id: searchContainer
        width: 400
        height: 30
        anchors {
            top: headerContact.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
        color: "gray"
        radius: 10

        Image {
            id: searchIcon
            width: 20
            height: 20
            anchors {
                left: parent.left
                leftMargin: 5
                verticalCenter: parent.verticalCenter
            }

            source: "qrc:/RESOURCES/Images/search_icon.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {

                }
            }
        }

        TextField {
            id: textInput
            placeholderText: "Search"
            placeholderTextColor: "#AEAEB0"
            width: parent.width - 60
            height: parent.height
            color: "white"
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            background: Item {
                anchors.fill: parent
                Rectangle {
                    anchors.fill: parent
                    color: "gray"
                }
            }
            onAccepted: {
            }
        }

        Image {
            id: deleteTextInputButton
            width: 15
            height: 15
            visible: textInput.cursorPosition >= 1
            source: "qrc:/RESOURCES/Images/delete_icon.png"
            anchors {
                right: parent.right
                rightMargin: 5
                verticalCenter: parent.verticalCenter
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    textInput.text = ""
                }
            }
        }

    }

    ListView {
        id: listContactPhone
        width: 400
        height: 828
        model: modelPhone
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: searchContainer.bottom
            topMargin: 10
        }

        delegate: Item {
            id: itemPhoneContact
            width: parent.width
            height: 50
            Text {
                id: nameContact
                color: "#FEFEFE"
                text: Name
            }

            Rectangle {
                id: separateCol
                width: 400
                height: 1
                anchors {
                    top: nameContact.bottom
                    topMargin: 10

                }

                color: "gray"
            }

        }
    }

    FooterPhone {
        id: footerPhone
        width: rootItem.width
        height: 100
        anchors.bottom: parent.bottom
        Rectangle {
            anchors.fill: parent
            color: "red"
            opacity: 0.5
        }
    }
}
