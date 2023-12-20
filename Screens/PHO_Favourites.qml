import QtQuick 2.15
import QtQuick.Controls 2.15
import "Common"
import "Common/Items"
import QML.Constants
import QML.Components

Item {
    id: rootItem

    QtObject {
        id: constant

        readonly property int title_x: 35
        readonly property int title_y: 70
        readonly property string title_screen_text: "Favorites"

        readonly property int empty_item: 0
        readonly property int favorite_list_height: 715

        readonly property int align_value: 70
        readonly property int ava_width: 36
        readonly property int ava_height: 36
    }

    Rectangle {
        anchors.fill: parent
        color: UIColors.screen_background
    }

    TitleScreen {
        id: titleScreen
        x: constant.title_x
        y: constant.title_y
        textStr: constant.title_screen_text
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
                    width: constant.align_value
                    height: parent.height

                    AvatarImg {
                        avatarName: model.formatname[0]
                    }
                }

                ContactItem {
                    id: item
                    width: parent.width - constant.align_value
                    anchors.right: parent.right
                    textStr: model.formatname
                    infoVisible: true
                    underlineVisible: model.index === ContactController.lastFavIndex
                }
            }
        }
    }
}
