import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

import "../Commons" as CommonComponent

Item {
    id: rootItem
    width: 428
    height: 926

    Component.onCompleted: {
        console.log("THAIVDVDVDVD")
//        var listTemp = PhoneController.listGroupName
//        for(let i = 0; i < listTemp.size(); ++i) {

//        }
    }

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
        Item {
            id: backButton
            height: parent.height
            width: 100
            opacity: backMouse.pressed ? 0.5 : 1
            Image {
                id: backIcon
                width: 30
                height: parent.height
                source: "qrc:/Resources/Images/back_arrow_icon.png"
            }
            Text {
                height: parent.height
                x: 35
                width: 30
                anchors {
                    top: parent.top
                    topMargin: 2
                }
                color: "#0D7FFA"
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
            source: "qrc:/Resources/Images/plus_icon.png"
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
        color: "#FDFDFD"
        font {
            pixelSize: 30
            weight: 600
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
        color: "#1C1C1E"
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

            source: "qrc:/Resources/Images/search_icon.png"
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
            color: "#FFFFFF"
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            background: Item {
                anchors.fill: parent
                Rectangle {
                    anchors.fill: parent
                    color: "#1C1C1E"
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
            source: "qrc:/Resources/Images/delete_icon.png"
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

    Rectangle {
        id: separateCol
        width: 390
        height: 1
        radius: 5
        anchors {
            top: searchContainer.bottom
            topMargin: 10
            left: parent.left
            leftMargin: 14
        }
        color: "#242424"
    }

    Item {
        id: userInforContainer
        width: 390
        height: 50
        anchors {
            top: separateCol.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
        Image {
            id: userImage
            property bool rounded: true
            property bool adapt: true
            width: 50
            height: 50
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
            source: "qrc:/Resources/Images/user_image.jpg"
            layer.enabled: rounded
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: userImage.width
                    height: userImage.height
                    Rectangle {
                        anchors.centerIn: parent
                        width: userImage.adapt ? userImage.width : Math.userImage(userImage.width, userImage.height)
                        height: userImage.adapt ? userImage.height : userImage.width
                        radius: Math.min(userImage.width, userImage.height)
                    }
                }
            }
        }
        Text {
            id: userName
            text: "VoThai"
            color: "#FDFDFD"
            font {
                pixelSize: 16
                weight: 500
            }
            anchors {
                left: userImage.right
                leftMargin: 10
                top: parent.top
                topMargin: 10
            }
        }
        Text {
            id: subUserName
            text: "My Card"
            color: "#AEAEB0"
            font {
                pixelSize: 10
                weight: 380
            }
            anchors {
                top: userName.bottom
                topMargin: 5
                left: userImage.right
                leftMargin: 10
            }
        }
    }

    // List of contact information
    ListView {
        id: listContactPhone
        width: 390
        height: 828
        model: ContactList
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: userInforContainer.bottom
            topMargin: 10
        }
        delegate: Item {
            id: itemPhoneContact
            width: parent.width
            height: 50
            Text {
                id: nameContact
                color: "#FFFFFF"
                text: model.NameContact
                font {
                    weight: 500
                }
            }
            Rectangle {
                id: separateCol1
                width: parent.width
                height: 1
                radius: 5
                anchors {
                    top: nameContact.bottom
                    topMargin: 10
                }
                color: "#242424"
            }
        }
    }

    QtObject {
        id: _priCtrlGroupName
        property var listGroupName: ["A", "B", "C"]
    }

    Column {
        id: nameGroupContainer
        width: 10
        height: 400
        spacing: 3
        anchors {
            left: listContactPhone.right
            leftMargin: 3
            top: listContactPhone.top
        }
        Repeater {
            id: repeaterCharacter
            model: 35
            Item {
                width: parent.width
                height: 10
                Text {
                    width: parent.width
                    height: 10
                    text: "A"
                    color: "#0D7FFA"
                    font {
                        pixelSize: 10
                    }
                }
            }
        }
    }

    CommonComponent.PHONE_FOOTER {
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