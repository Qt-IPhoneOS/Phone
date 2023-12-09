import QtQuick 2.15
import QtQuick.Controls 2.15
import "Common"
import "JS/def_colors.js" as COLOR
import QML.Components

Item {
    id: rootItem

    QtObject {
        id: constant

        readonly property string listStr: "Lists"
        readonly property string contactStr: "Recents"

        readonly property int horizontalCenterScreen: 70
        readonly property int imageSize: 65
    }

    Rectangle {
        anchors.fill: parent
        color: "#f0f2f5"
    }

    HeaderScreen {
        width: parent.width
        backBtnText: constant.listStr
    }

    Item {
        id: content
        width: parent.width - constant.horizontalCenterScreen
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: headerContact
            y: 70
            color: COLOR.blackColor
            font {
                pixelSize: 30
                weight: 600
            }
            text: constant.contactStr
        }

        Underline {
            id: underline
            width: parent.width
            anchors.top: headerContact.bottom
            anchors.topMargin: 10
        }

        ListView {
            id: listContactPhone
            width: parent.width
            height: 535
            model: RecentModel.dataModel

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: underline.bottom
                topMargin: 0
            }

            delegate: Rectangle {
                id: itemPhoneContact
                width: parent.width
                height: 50
                Text {
                    id: nameContact
                    color: COLOR.blackColor
                    text: model.formatname !== "" ? model.formatname : model.number
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
    }
}
