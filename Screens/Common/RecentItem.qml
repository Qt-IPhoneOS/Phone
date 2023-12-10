import QtQuick 2.15
import QtQuick.Controls 2.15
import QML.Components
import "../JS/def_colors.js" as COLOR

Item {
    id: itemPhoneContact
    width: parent.width
    height: 50

    property string recentText: ""

    Text {
        id: nameContact
        width: parent.width
        height: parent.height - underline.height
        text: recentText
        verticalAlignment: Text.AlignVCenter
        color: COLOR.blackColor
        font {
            weight: 500
        }
    }

    Underline {
        width: parent.width
        anchors.top: nameContact.bottom
    }
}
