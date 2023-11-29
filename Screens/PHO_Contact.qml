import QtQuick 2.15
import QtQuick.Controls 2.15
import "Common"
import "JS/def_colors.js" as COLOR

Item {
    id: rootItem

    Rectangle {
        anchors.fill: parent
        color: "#f0f2f5"
    }

    HeaderScreen {
        width: parent.width
        backBtnText: "Lists"
        onBack: {

        }
    }

    Item {
        id: content
        width: parent.width - 70
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: headerContact
            y: 70
            color: COLOR.blackColor
            font {
                pixelSize: 30
                weight: 600
            }
            text: "Contacts"
        }

        SearchInput {
            id: searchContainer
        }

        Underline {
            id: underline
            width: parent.width
            anchors.top: searchContainer.bottom
            anchors.topMargin: 10
        }

        Item {
            id: userInforContainer
            width: parent.width
            anchors {
                top: underline.bottom
                topMargin: 15
                horizontalCenter: parent.horizontalCenter
            }
            Image {
                id: userImage
                property bool rounded: true
                width: 65
                height: 65

                source: "qrc:/Assets/user_image.jpg"

                //layer.enabled: rounded
    //            layer.effect: OpacityMask {
    //                maskSource: Item {
    //                    width: userImage.width
    //                    height: userImage.height
    //                    Rectangle {
    //                        anchors.centerIn: parent
    //                        width: userImage.width
    //                        height: userImage.height
    //                        radius: Math.min(userImage.width, userImage.height)
    //                    }
    //                }
    //            }
            }
            Text {
                id: userName
                text: "Me"
                color: COLOR.blackColor
                font {
                    pixelSize: 20
                    weight: 500
                }
                anchors {
                    left: userImage.right
                    leftMargin: 25
                    top: parent.top
                    topMargin: 10
                }
            }
            Text {
                id: subUserName
                text: "My Card"
                color: "#8E8E8E"
                font {
                    pixelSize: 13
                    weight: 380
                }
                anchors {
                    top: userName.bottom
                    topMargin: 10
                    left: userImage.right
                    leftMargin: 25
                }
            }
        }

        ListView {
            id: listContactPhone
            width: parent.width
            height: 535
            model: ContactModel.contactListModel

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: userInforContainer.bottom
                topMargin: 100
            }

            delegate: Item {
                id: itemPhoneContact
                width: parent.width
                height: 50
                Text {
                    id: nameContact
                    color: COLOR.blackColor
                    text: Name
                    font {
                        weight: 500
                    }

                }
                Underline {
                    width: parent.width
                    anchors.top: nameContact.bottom
                    anchors.topMargin: 10
                }
            }
            section {
                property: "text"
                criteria: ViewSection.FirstCharacter
                delegate: Item {
                    id: itemPhoneContact
                    width: parent.width
                    height: 50
                    Text {
                        id: nameContact
                        color: COLOR.grayTextColor
                        text: section
                        font {
                            weight: 500
                        }
                    }
                }
            }
        }

        QtObject {
            id: _priCtrlGroupName

            function convertIntToChar(integer) {
                let character = integer + 65
                return String.fromCharCode(character)
            }
        }
    }

    Column {
        id: nameGroupContainer
        width: 10
        height: 400
        spacing: 3
        anchors {
            right: parent.right
            rightMargin: 10
            top: parent.top
            topMargin: 250
        }
        Repeater {
            id: repeaterCharacter
            model: 26
            Item {
                width: parent.width
                height: 10
                Text {
                    id: groupName
                    height: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: _priCtrlGroupName.convertIntToChar(index)
                    color: "#0D7FFA"
                    font {
                        pixelSize: 10
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log(groupName.text)
                    }
                }
            }
        }
    }
}
