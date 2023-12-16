import QtQuick 2.15
import QtQuick.Controls 2.15
//import QtGraphicalEffects 1.15
import "Common"
import QML.Constants

Item {
    id: rootItem
    width: UIConstants.screen_width
    height: UIConstants.screen_height

    Loader {
        id: loaderMainScreenPhone
        width: parent.width
        height: parent.height - 60
        active: true
        source: ScreenSource
    }

    PhoneFooter {
        id: footerPhone
        width: parent.width
        height: 60
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
    }
}
