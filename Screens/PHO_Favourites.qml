import QtQuick 2.15
import QtQuick.Controls 2.15
import QML.Constants
import QML.Components
import "Common"
import "Common/Items"


Item {
    id: rootItem

    QtObject {
        id: constant

        readonly property int avatar_area: 90
        readonly property int empty_item: 0
        readonly property int favorite_list_height: 735
    }

    HeaderScreen {
        id: header
        width: parent.width
        isBackButton: false
        rightText: "Edit"

        Image {
            y: 20
            width: 30
            height: 30
            source: "qrc:/Assets/plus_icon.png"
            anchors {
                left: parent.left
                leftMargin: 20
            }
        }
    }

    RootScreen {
        id: root
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        contentHeight: content.childrenRect.height + 100
        TitleScreen {
            id: titleScreen
            x: 35
            y: 70
            textStr: "Favorites"
        }

        onContentYChanged: {
            if (contentY > 20) {
                header.enableHeader = true
                header.headerText = "Favorites"
            }
            else {
                header.enableHeader = false
                header.headerText = ""
            }
        }

        Item {
            id: content
            width: parent.width

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: titleScreen.top
                topMargin: UIAligns.margin_50
            }

            ListView {
                id: favoriteList
                width: parent.width
                height: constant.favorite_list_height
                model: ContactController.dataModel
                interactive: false

                delegate: Item {
                    id: itemPhoneFav
                    width: model.favourite ? parent.width : constant.empty_item
                    height: model.favourite ? item.height : constant.empty_item
                    visible: model.favourite

                    Item {
                        width: constant.avatar_area
                        height: parent.height

                        Avatar {
                            width: 46
                            height: 46
                            anchors.centerIn: parent
                            isImage: model.avatar !== ""
                            avatarName: (!isImage && model.formatname[0]) ? model.formatname[0] : ""
                            sourceImg: model.avatar
                        }
                    }

                    ContactItem {
                        id: item
                        width: parent.width - constant.avatar_area
                        height: 60
                        anchors.right: parent.right
                        textStr: model.formatname
                        infoVisible: true
                    }
                }
            }
        }
    }
}

