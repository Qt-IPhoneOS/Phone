import QtQuick 2.15
import QtQuick.Controls 2.15
import QML.Constants
import QML.Components
import "Common"
import "Common/Items"

PhoneScreen {
    id: rootItem

    QtObject {
        id: constant

        readonly property int avatar_area: 70
        readonly property int empty_item: 0
        readonly property int favorite_list_height: 715
    }

    TitleScreen {
        id: titleScreen
        x: 35
        y: 70
        textStr: "Favorites"
    }

    Item {
        id: content
        width: parent.width

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: titleScreen.top
            topMargin: UIAligns.margin_70
        }

        ListView {
            id: favoriteList
            width: parent.width
            height: constant.favorite_list_height
            model: ContactController.dataModel

            delegate: Item {
                id: itemPhoneFav
                width: model.favourite ? parent.width : constant.empty_item
                height: model.favourite ? item.height : constant.empty_item
                visible: model.favourite

                Item {
                    width: constant.avatar_area
                    height: parent.height

                    Avatar {
                        width: 36
                        height: 36
                        anchors.centerIn: parent
                        isNoImage: true
                        avatarName: model.formatname[0] ? model.formatname[0] : ""
                    }
                }

                ContactItem {
                    id: item
                    width: parent.width - constant.avatar_area
                    anchors.right: parent.right
                    textStr: model.formatname
                    infoVisible: true
                    underlineVisible: model.index === ContactController.lastFavIndex
                }
            }
        }
    }
}
