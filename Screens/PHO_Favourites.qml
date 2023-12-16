import QtQuick 2.15
import QtQuick.Controls 2.15
import "Common"
import QML.Constants
import QML.Components

Item {
    id: rootItem

    QtObject {
        id: constant

        readonly property int horizontalCenterScreen: 70
    }

    Rectangle {
        anchors.fill: parent
        color: "#f0f2f5"
    }

    Item {
        id: header
        y: 30
        width: parent.width

        Text {
            text: "Favorites"
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            font {
                pixelSize: 20
                weight: Font.Bold
            }
        }
    }

    Item {
        id: content
        width: parent.width - constant.horizontalCenterScreen
        anchors.horizontalCenter: parent.horizontalCenter

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 100
        }

        ListView {
            id: favoriteList
            width: parent.width
            height: 535
            model: ContactController.dataModel

            delegate: Item {
                id: itemPhoneFav
                width: model.favourite ? parent.width : 0
                height: model.favourite ? 50 : 0
                visible: model.favourite
                Text {
                    id: nameFav
                    color: UIColors.black
                    text: model.formatname
                    font {
                        weight: 500
                    }

                }

                Underline {
                    width: parent.width
                    anchors.top: nameFav.bottom
                    anchors.topMargin: 10
                }
            }
        }
    }
}
