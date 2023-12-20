import QtQuick 2.15
import QtQuick.Controls 2.15
import Enums 1.0
import QML.Components
import QML.Constants
import "Common"
import "Common/Items"

Item {
    id: rootItem

    property bool switchOn: false

    QtObject {
        id: constant

        readonly property string title_screen_text: "Recents"

        readonly property int title_x: 70
        readonly property int title_y: 70
        readonly property int empty_item: 0
        readonly property int recent_switch_y: 20
        readonly property int recent_list_height: 700
    }

    Rectangle {
        anchors.fill: parent
        color: UIColors.screen_background
    }

    RecentSwitch {
        y: constant.recent_switch_y
        switchOn: RecentController.recentMode === Enums.Recent_Missed
        anchors.horizontalCenter: parent.horizontalCenter
        onSwitched: RecentController.recentMode = RecentController.recentMode === Enums.Recent_Missed ? Enums.Recent_All : Enums.Recent_Missed
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
            id: listContactPhone
            width: parent.width
            height: constant.recent_list_height
            model: RecentController.dataModel

            delegate: Item {
                width: parent.width
                height: RecentController.recentMode === Enums.Recent_All ? itemRecent.height : (model.type !== Enums.Missed ? constant.empty_item : itemRecent.height)

                Item {
                    width: constant.title_x
                    height: parent.height

                    AvatarImg {
                        avatarName: model.formatname[0] ? model.formatname[0] : ""
                    }
                }

                RecentItem {
                    id: itemRecent
                    width: parent.width - constant.title_x
                    anchors.right: parent.right
                    visible: RecentController.recentMode === Enums.Recent_All ? true : (model.type === Enums.Missed)
                    isMissed: model.type === Enums.Missed
                    infoVisible: true
                    recentName: model.formatname !== "" ? model.formatname : model.number
                    recentType: model.type === Enums.Missed ? "Missed" : (model.type === Enums.Outgoing ? "Outgoing" : "Incoming")
                    underlineVisible: RecentController.recentMode === Enums.Recent_All ? model.index === RecentController.dataModel.count - 1
                                                                                       : model.index === RecentController.lastHistoryIndex
                }
            }
        }
    }
}
