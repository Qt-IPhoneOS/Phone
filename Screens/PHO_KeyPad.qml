import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "Common"
import QML.Constants
import QML.Components

Item {
    id: rootItem

    QtObject {
        id: constant

        readonly property int number_text_y: 110

        readonly property int add_number_y: 160
        readonly property string add_number: "Add Number"

        readonly property int grid_keypad_y: 100
        readonly property int keypad_columns: 3
        readonly property int keypad_rows: 4
        readonly property int columns_spacing: 55
        readonly property int rows_spacing: 20

        readonly property int phone_call_width: 90
        readonly property int phone_call_height: 90
        readonly property string phone_call_img:  "qrc:/Assets/phone_call.png"

        readonly property int close_btn_x: 430
        readonly property int close_btn_width: 40
        readonly property int close_btn_height: 40
        readonly property int close_btn_pixel: 25
        readonly property int close_btn_radius: 4
    }

    Rectangle {
        anchors.fill: parent
        color: UIColors.screen_background
    }

    CustomText {
        y: constant.number_text_y
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        visible: KeypadController.numberSelected !== ""
        text: KeypadController.numberSelected
        color: UIColors.black
        fontSize: UIConstants.biggest_pixel
        fontWeight: UIConstants.medium_weight
    }

    CustomText {
        id: addNumber
        y: constant.add_number_y
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        text: constant.add_number
        color: UIColors.blue
        fontWeight: UIConstants.light_weight
        opacity: KeypadController.numberSelected !== ""
        enableAnimation: true
        visibleAnimation: KeypadController.numberSelected !== ""
    }

    Item {
        y: constant.grid_keypad_y
        width: parent.width
        height: parent.height - constant.grid_keypad_y

        GridLayout {
            id: gridView
            width: parent.width - (constant.grid_keypad_y * 2)
            columns: constant.keypad_columns
            rows: constant.keypad_rows
            anchors.centerIn: parent
            columnSpacing: constant.columns_spacing
            rowSpacing: constant.rows_spacing

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
            height: constant.phone_call_height
            anchors.top: gridView.bottom
            anchors.topMargin: UIConstants.margin_top_20

            Image {
                id: phoneCall
                width: constant.phone_call_width
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                source: constant.phone_call_img
            }

            Rectangle {
                id: closeBtn
                x: constant.close_btn_x
                width: constant.close_btn_width
                height: constant.close_btn_height
                color: mouseArea.pressed ? UIColors.light_grey : UIColors.greyish
                radius: constant.close_btn_radius
                anchors.verticalCenter: parent.verticalCenter
                opacity: KeypadController.numberSelected !== ""

                property bool enableAnimation: KeypadController.numberSelected !== ""

                Text {
                    anchors.centerIn: parent
                    text: "X"
                    color: UIColors.black
                    font.pixelSize: constant.close_btn_pixel
                }

                PropertyAnimation {
                    id: fadeInAnimation
                    target: closeBtn
                    property: "opacity"
                    from: UIConstants.opacity_0
                    to: UIConstants.opacity_1
                    duration: UIConstants.duration_400
                }

                PropertyAnimation {
                    id: fadeOutAnimation
                    target: closeBtn
                    property: "opacity"
                    from: UIConstants.opacity_1
                    to: UIConstants.opacity_0
                    duration: UIConstants.duration_400
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
