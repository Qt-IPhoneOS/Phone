import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "CItems"

Rectangle {
    id: rootItem
    color: "#e3e3e3"

    signal typeOfScreen(int index)

    Underline {
        color: "#D3D3D3"
    }

    RowLayout {
        id: listIconFooter
        anchors.fill: parent
        anchors.verticalCenter: parent.verticalCenter

        spacing: 0
        IconButton {
            id: favouriteIcon
            Layout.fillWidth: true
            Layout.fillHeight: true
            titleIcon: "Favourites"
            sourceNormal: "qrc:/Assets/favourite_icon_normal.png"
            sourcePressed: "qrc:/Assets/favourite_icon_active.png"
            onTransferScreen: {
                rootItem.typeOfScreen(0)
            }
        }
        IconButton {
            id: recentsIcon
            Layout.fillWidth: true
            Layout.fillHeight: true
            titleIcon: "Recents"
            sourceNormal: "qrc:/Assets/recent_icon_normal.png"
            sourcePressed: "qrc:/Assets/recent_icon_active.png"
            onTransferScreen: {
                rootItem.typeOfScreen(1)
            }
        }
        IconButton {
            id: contactsIcon
            Layout.fillWidth: true
            Layout.fillHeight: true
            titleIcon: "Contacts"
            sourceNormal: "qrc:/Assets/contact_icon_normal.png"
            sourcePressed: "qrc:/Assets/contact_icon_active.png"
            onTransferScreen: {
                rootItem.typeOfScreen(2)
            }
        }
        IconButton {
            id: keypadIcon
            Layout.fillWidth: true
            Layout.fillHeight: true
            titleIcon: "Keypad"
            sourceNormal: "qrc:/Assets/keypad_nonactive.png"
            sourcePressed: "qrc:/Assets/keypad_active.png"
            onTransferScreen: {
                rootItem.typeOfScreen(3)
            }
        }
        IconButton {
            id: voicemailIcon
            Layout.fillWidth: true
            Layout.fillHeight: true
            titleIcon: "Voicemail"
            sourceNormal: "qrc:/Assets/voicemail_icon_normal.png"
            sourcePressed: "qrc:/Assets/voicemail_icon_active.png"
            onTransferScreen: {
                rootItem.typeOfScreen(4)
            }
        }
    }
}
