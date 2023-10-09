import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: rootItem
    signal pressed()
    signal pressedAndHold()
    signal myPressedAndHold()

    property bool isActive: false

    Timer {
        id: timerToTrigger
        interval: 500
        running: false
        repeat: true
        onTriggered: {
            console.log("123")
            rootItem.myPressedAndHold()
        }
    }

    MouseArea {
        anchors.fill: parent
        onPressed: {
            if (isActive) mouse.accepted = false
            else rootItem.pressed()
        }

        onPressAndHold: {
            console.log("PRESS HERE")
            timerToTrigger.start()
        }

        onReleased: {
            timerToTrigger.stop()
        }
    }


}
