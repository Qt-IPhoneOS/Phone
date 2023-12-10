import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Enums 1.0
import QML.Components

Rectangle {
    id: rootItem
    color: "#e3e3e3"

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
            isActive: AppEngine.screenActive === Enums.PHO_Favourites
            sourceIcon: AppEngine.screenActive === Enums.PHO_Favourites ? "qrc:/Assets/favourite_icon_active.png" : "qrc:/Assets/favourite_icon_normal.png"
            onTransferScreen: {
                AppEngine.showScreen(Enums.PHO_Favourites)
            }
        }
        IconButton {
            id: recentsIcon
            Layout.fillWidth: true
            Layout.fillHeight: true
            titleIcon: "Recents"
            isActive: AppEngine.screenActive === Enums.PHO_Recents
            sourceIcon: AppEngine.screenActive === Enums.PHO_Recents ? "qrc:/Assets/recent_icon_active.png" : "qrc:/Assets/recent_icon_normal.png"

            onTransferScreen: {
                AppEngine.showScreen(Enums.PHO_Recents)
            }
        }
        IconButton {
            id: contactsIcon
            Layout.fillWidth: true
            Layout.fillHeight: true
            titleIcon: "Contacts"
            isActive: AppEngine.screenActive === Enums.PHO_Contact
            sourceIcon: AppEngine.screenActive === Enums.PHO_Contact ? "qrc:/Assets/contact_icon_active.png" : "qrc:/Assets/contact_icon_normal.png"

            onTransferScreen: {
                AppEngine.showScreen(Enums.PHO_Contact)
            }
        }
        IconButton {
            id: keypadIcon
            Layout.fillWidth: true
            Layout.fillHeight: true
            titleIcon: "Keypad"
            isActive: AppEngine.screenActive === Enums.PHO_KeyPad
            sourceIcon: AppEngine.screenActive === Enums.PHO_KeyPad ? "qrc:/Assets/keypad_active.png" : "qrc:/Assets/keypad_nonactive.png"
            onTransferScreen: {
                AppEngine.showScreen(Enums.PHO_KeyPad)
            }
        }
        IconButton {
            id: voicemailIcon
            Layout.fillWidth: true
            Layout.fillHeight: true
            titleIcon: "Voicemail"
            isActive: AppEngine.screenActive === Enums.PHO_VoiceMail
            sourceIcon: AppEngine.screenActive === Enums.PHO_VoiceMail ? "qrc:/Assets/voicemail_icon_active.png" : "qrc:/Assets/voicemail_icon_normal.png"
            onTransferScreen: {
                AppEngine.showScreen(Enums.PHO_VoiceMail)
            }
        }
    }
}
