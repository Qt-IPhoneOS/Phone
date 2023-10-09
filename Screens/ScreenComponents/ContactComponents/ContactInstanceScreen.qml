import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts
import "../../Common" as CommonComponent
import "../../../JS/def_colors.js" as COLOR
import "../../Common/CItems" as CItems

Item {
    id: specificContact

    Rectangle {
        anchors.fill: parent
        color: COLOR.grayBackgroundColor
        Image {
            id: avatarImages
            width: 100
            height: 100
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 100
            }
            source: "qrc:/Assets/user_image.jpg"
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: avatarImages.width
                    height: avatarImages.height
                    Rectangle {
                        anchors.centerIn: parent
                        width: avatarImages.width
                        height: avatarImages.height
                        radius: parent.width
                    }
                }
            }
        }

        Text {
            id: nameContact
            text: "Anh Bao"
            color: COLOR.blackColor
            font {
                pixelSize: 25
            }
            anchors {
                top: avatarImages.bottom
                topMargin: 10
                horizontalCenter: parent.horizontalCenter
            }
        }

        RowLayout {
            id: listButton
            width: parent.width - 20
            height: 60
            anchors {
                top: nameContact.bottom
                topMargin: 25
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 10
            CItems.IconButton {
                id: sendMessageBtn
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 15
            }
            CItems.IconButton {
                id: outCallingBtn
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 15
            }
            CItems.IconButton {
                id: videoCallBtn
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 15
            }
            CItems.IconButton {
                id: sendMailBtn
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 15
            }
        }

        Rectangle {
            id: phoneNumberRec
            width: parent.width - 20
            height: 70
            radius: 15
            anchors {
                top: listButton.bottom
                topMargin: 25
                horizontalCenter: parent.horizontalCenter
            }
            Text {
                id: typeContact
                anchors {
                    left: parent.left
                    leftMargin: 15
                    top: parent.top
                    topMargin: 12
                }
                color: COLOR.blackColor
                text: "phone"
            }
            Text {
                id: phoneContact
                text: "093 5008291"
                color: COLOR.blueColorText
                anchors {
                    left: parent.left
                    leftMargin: 15
                    top: typeContact.top
                    topMargin: 20
                }
                font.pixelSize: 18
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log(typeContact.font.pixelSize)
                }
            }
        }

        Rectangle {
            id: facetimeRec
            width: parent.width - 20
            height: 70
            radius: 15
            anchors {
                top: phoneNumberRec.bottom
                topMargin: 25
                horizontalCenter: parent.horizontalCenter
            }
            Text {
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 15
                }
                text: "FaceTime"
                color: COLOR.blackColor
                font.pixelSize: 18
            }
            CItems.IconButton {
                id: facetimeButton
                buttonWidth: 50
                buttonHeight: 50
                color: COLOR.grayBackgroundColor
                radius: facetimeButton.height
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: outcallingButton.left
                    rightMargin: 15
                }
            }
            CItems.IconButton {
                id: outcallingButton
                buttonWidth: 50
                buttonHeight: 50
                color: COLOR.grayBackgroundColor
                radius: outcallingButton.height
                anchors {
                    right: parent.right
                    rightMargin: 15
                    verticalCenter: parent.verticalCenter
                }
            }
        }
        Rectangle {
            id: notesRec
            width: parent.width - 20
            height: 100
            radius: 15
            anchors {
                top: facetimeRec.bottom
                topMargin: 25
                horizontalCenter: parent.horizontalCenter
            }
            Text {
                anchors {
                    left: parent.left
                    leftMargin: 15
                    top: parent.top
                    topMargin: 10
                }
                text: "Notes"
                color: COLOR.blackColor
                font.pixelSize: 18
            }
        }

    }



}
