import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "Common"
import QML.Constants
import QML.Components

PhoneScreen {
    id: rootItem

    CustomText {
        y: 110
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        visible: KeypadController.numberSelected !== ""
        text: KeypadController.numberSelected
        color: UIColors.black
        fontSize: UIFonts.biggest_pixel
        fontWeight: UIFonts.medium_weight
    }

    CustomText {
        id: addNumber
        y: 160
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        color: UIColors.blue
        text: "Add Number"
        fontWeight: UIFonts.light_weight
        opacity: KeypadController.numberSelected !== ""
        enableAnimation: true
        visibleAnimation: KeypadController.numberSelected !== ""
    }

    Item {
        y: 100
        width: parent.width
        height: parent.height - 100

        GridLayout {
            id: gridView
            width: parent.width - 200
            anchors.centerIn: parent
            columns: 3
            rows: 4
            columnSpacing: 55
            rowSpacing: 20

            Repeater {
                model: keypadList
                KeypadButton {
                    id: button
                    number: model.number
                    desc: model.desc

                    Connections {
                        target: button

                        function onKeypadClicked(value) {
                            KeypadController.numberSelected += value
                        }
                    }
                }
            }
        }

        Item {
            width: parent.width
            height: 90
            anchors.top: gridView.bottom
            anchors.topMargin: UIAligns.margin_20

            Image {
                id: phoneCall
                width: 90
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                source: "qrc:/Assets/phone_call.png"
            }

            Rectangle {
                id: closeBtn
                x: 430
                width: 40
                height: 40
                radius: 4
                anchors.verticalCenter: parent.verticalCenter
                color: mouseArea.pressed ? UIColors.light_grey : UIColors.greyish
                opacity: KeypadController.numberSelected !== ""

                property bool enableAnimation: KeypadController.numberSelected !== ""

                CustomText {
                    textStr: "X"
                    anchors.centerIn: parent
                    fontSize: 25
                }

                PropertyAnimation {
                    id: fadeInAnimation
                    target: closeBtn
                    property: "opacity"
                    from: UIAligns.opacity_0
                    to: UIAligns.opacity_1
                    duration: UIAligns.duration_400
                }

                PropertyAnimation {
                    id: fadeOutAnimation
                    target: closeBtn
                    property: "opacity"
                    from: UIAligns.opacity_1
                    to: UIAligns.opacity_0
                    duration: UIAligns.duration_400
                }

                onEnableAnimationChanged: {
                    enableAnimation ? fadeInAnimation.start() : fadeOutAnimation.start()
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent

                    onClicked: {
                        KeypadController.popNumber()
                    }
                }
            }
        }
    }

    ListModel {
        id: keypadList

        Component.onCompleted: {
            keypadList.append({number: "1", desc: ""})
            keypadList.append({number: "2", desc: "A B C"})
            keypadList.append({number: "3", desc: "D E F"})
            keypadList.append({number: "4", desc: "G H I"})
            keypadList.append({number: "5", desc: "J K L"})
            keypadList.append({number: "6", desc: "M N O"})
            keypadList.append({number: "7", desc: "P Q R S"})
            keypadList.append({number: "8", desc: "T U V"})
            keypadList.append({number: "9", desc: "W X Y Z"})
            keypadList.append({number: "", desc: "*"})
            keypadList.append({number: "0", desc: "+"})
            keypadList.append({number: "", desc: "#"})
        }
    }
}
