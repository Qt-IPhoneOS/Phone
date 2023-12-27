import QtQuick 2.15
import QtQuick.Controls 2.15
import QML.Components
import QML.Constants

Item {
    id: itemRecent
    width: parent.width
    height: constant.recent_item_height

    property bool isMissed: false
    property string recentName: ""
    property string recentType: ""
    property string recentTime: ""
    property bool underlineVisible: false
    property bool infoVisible: false

    QtObject {
        id: constant

        readonly property int recent_item_height: 60
    }

    Underline {
        width: parent.width
        anchors.top: itemRecent.top
    }

    Column {
        width: parent.width
        height: parent.height
        y: 7
        spacing: 5

        CustomText {
            id: nameRecent
            textStr: recentName
            color: UIColors.black
            fontWeight: UIFonts.medium_weight
        }

        CustomText {
            id: typeRecent
            textStr: recentType
            color: isMissed ? UIColors.red : UIColors.grey
            fontWeight: UIFonts.medium_weight
            fontSize: UIFonts.smallest_pixel
        }
    }

    CustomText {
        id: timeRecent
        textStr: recentTime
        color: UIColors.grey
        fontWeight: UIFonts.medium_weight
        fontSize: UIFonts.smallest_pixel

        anchors {
            verticalCenter: parent.verticalCenter
            right: infoBtn.left
            rightMargin: UIAligns.margin_10
        }
    }

    InfoButton {
        id: infoBtn
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: UIAligns.margin_30
        }
        visible: infoVisible
    }

    Underline {
        width: parent.width
        anchors.top: itemRecent.bottom
        visible: underlineVisible
    }
}
