import QtQuick 2.15
import QtQuick.Controls 2.15
import QML.Components
import QML.Constants

Item {
    id: itemPhoneContact
    width: parent.width
    height: 50

    property bool isMissed: false
    property string recentText: ""

    Text {
        id: nameContact
        width: parent.width
        height: parent.height - underline.height
        text: recentText
        verticalAlignment: Text.AlignVCenter
        color: isMissed ? UIColors.red : UIColors.black
        font {
            weight: 500
        }
    }

    Underline {
        width: parent.width
        anchors.top: nameContact.bottom
    }
}
