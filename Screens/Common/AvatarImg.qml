import QtQuick 2.15
import QML.Constants
import QML.Components

Rectangle {
    width: 36
    height: 36
    color: UIColors.light_grey
    anchors.centerIn: parent
    radius: width / 2

    property string avatarName: ""

    CustomText {
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: UIColors.white
        textStr: avatarName
    }
}
