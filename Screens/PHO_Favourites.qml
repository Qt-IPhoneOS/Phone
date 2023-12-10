import QtQuick 2.15
import QtQuick.Controls 2.15
import "Common"
import "JS/def_colors.js" as COLOR
import QML.Components

Item {
    id: rootItem

    QtObject {
        id: constant
    }

    Rectangle {
        anchors.fill: parent
        color: "#f0f2f5"
    }
}
