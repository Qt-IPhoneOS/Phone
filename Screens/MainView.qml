import QtQuick 2.15
import QtQuick.Controls 2.15
//import QtGraphicalEffects 1.15

import "Common"
import "JS/def_colors.js" as COLOR

Item {
    id: rootItem
    width: ScreenWidth
    height: ScreenHeight

    Loader {
        id: loaderMainScreenPhone
        anchors.fill: parent
        active: true
        source: ScreenSource
    }

    PhoneFooter {
        id: footerPhone
        width: parent.width
        height: 60
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
    }

    Connections {
        target: footerPhone
        function onTypeOfScreen(indx) {
            switch(indx) {
            case 0:
                loaderMainScreenPhone.source = "qrc:/Resources/Screens/ScreenComponents/FavouriteScreen.qml"
                break
            case 1:
                loaderMainScreenPhone.source = "qrc:/Resources/Screens/ScreenComponents/RecentScreen.qml"
                break
            case 2:
                loaderMainScreenPhone.source = "qrc:/Resources/Screens/ScreenComponents/ContactScreen.qml"
                break
            case 3:
                loaderMainScreenPhone.source = "qrc:/Resources/Screens/ScreenComponents/KeypadScreen.qml"
                break
            case 4:
                loaderMainScreenPhone.source = "qrc:/Resources/Screens/ScreenComponents/FavouriteScreen.qml"
                break
            }
        }
    }
}
