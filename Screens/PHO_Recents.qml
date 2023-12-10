import QtQuick 2.15
import QtQuick.Controls 2.15
import Enums 1.0
import QML.Components
import "Common"
import "JS/def_colors.js" as COLOR

Item {
    id: rootItem

    property bool switchOn: false

    QtObject {
        id: constant

        readonly property string listStr: "Lists"
        readonly property string recentsStr: "Recents"

        readonly property int horizontalCenterScreen: 70
        readonly property int imageSize: 65
    }

    Rectangle {
        anchors.fill: parent
        color: "#f0f2f5"
    }

    RecentSwitch {
        y: 20
        switchOn: RecentModel.recentMode === Enums.Recent_Missed
        anchors.horizontalCenter: parent.horizontalCenter
        onSwitched: RecentModel.recentMode = RecentModel.recentMode === Enums.Recent_Missed ? Enums.Recent_All : Enums.Recent_Missed
    }

    Item {
        id: content
        width: parent.width - constant.horizontalCenterScreen
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: headerContact
            y: 80
            color: COLOR.blackColor
            font {
                pixelSize: 30
                weight: 600
            }
            text: constant.recentsStr
            z: 1
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
            height: 700
            model: RecentModel.dataModel
            z: 0

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: underline.bottom
                topMargin: 0
            }

            delegate: RecentItem {
                visible: RecentModel.recentMode === Enums.Recent_All ? true : (model.type === Enums.Missed)
                isMissed: model.type === Enums.Missed
                height: RecentModel.recentMode === Enums.Recent_All ? 50 : (model.type !== Enums.Missed ? 0 : 50)
                recentText: model.formatname !== "" ? model.formatname : model.number
            }
        }
    }
}
