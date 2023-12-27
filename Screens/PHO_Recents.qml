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
    anchors.fill: parent

    QtObject {
        id: constant

        readonly property int empty_item: 0
        readonly property int recent_list_height: 700
        readonly property int avatar_area: 90
    }

    Rectangle {
        anchors.fill: parent
        color: UIColors.screen_background
    }

    RecentSwitch {
        y: 20
        z: 1
        switchOn: RecentController.recentMode === Enums.Recent_Missed
        anchors.horizontalCenter: parent.horizontalCenter
        onRequestAll: RecentController.recentMode = Enums.Recent_All
        onRequestMissed: RecentController.recentMode = Enums.Recent_Missed
    }

    RootScreen {
        width: parent.width
        height: parent.height
        contentHeight: listRecent.childrenRect.height + 100

        TitleScreen {
            x: 70
            y: 70
            id: titleScreen
            textStr: "Recents"
        }


        ListView {
            id: listRecent
            width: parent.width
            height: constant.recent_list_height
            model: RecentController.dataModel
            interactive: false

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: titleScreen.top
                topMargin: UIAligns.margin_50
            }

            delegate: Item {
                width: parent.width
                height: RecentController.recentMode === Enums.Recent_All ? itemRecent.height : (model.type !== Enums.Missed ? constant.empty_item : itemRecent.height)

                Item {
                    width: constant.avatar_area
                    height: parent.height
                    visible: RecentController.recentMode === Enums.Recent_All ? true : (model.type === Enums.Missed)

                    Avatar {
                        width: 46
                        height: 46
                        anchors.centerIn: parent
                        isImage: model.avatar !== "" && model.formatname[0] !== ""
                        sourceImg: model.avatar
                        avatarName: model.formatname !== "" ? model.formatname[0] : ""
                    }
                }

                RecentItem {
                    id: itemRecent
                    width: parent.width - constant.avatar_area
                    anchors.right: parent.right
                    visible: RecentController.recentMode === Enums.Recent_All ? true : (model.type === Enums.Missed)
                    isMissed: model.type === Enums.Missed
                    infoVisible: true
                    recentName: model.formatname !== "" ? model.formatname : model.number
                    recentTime: model.time
                    recentType: model.type === Enums.Missed ? "Missed" : (model.type === Enums.Outgoing ? "Outgoing" : "Incoming")
                    underlineVisible: RecentController.recentMode === Enums.Recent_All ? model.index === RecentController.dataModel.count - 1
                                                                                       : model.index === RecentController.lastHistoryIndex
                }
            }
        }

    }
}
