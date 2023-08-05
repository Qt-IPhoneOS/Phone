import QtQuick 2.15
import "../UICommon"

Item {
    Rectangle {
        anchors.fill: parent
        color: "gray"
    }
    FooterPhone {
        id: footerPhone
        width: rootItem.width
        height: 100
        anchors.bottom: parent.bottom
        Rectangle {
            anchors.fill: parent
            color: "red"
            opacity: 0.5
        }


    }
}
