import QtQuick 2.15
import QtQuick.Controls 2.15
import "Common"
import "Common/Items"
import QML.Constants
import QML.Components

Item {
    id: rootItem

    QtObject {
        id: constant

        readonly property int header_y: 30
        readonly property string header_text: "Lists"
        readonly property string title_screen_text: "Contacts"
        readonly property string my_card_text: "My Card"
        readonly property string name_card_text: "Me"

        readonly property int horizontal_align: 70
        readonly property int image_size: 65
        readonly property int title_y: 70

        readonly property int contact_list_height: 535

        readonly property int group_width: 10
        readonly property int group_height: 400
        readonly property int group_spacing: 5
        readonly property int group_margin: 250
        readonly property int group_model: 26
        readonly property int item_height: 10

        readonly property string user_image_source: "qrc:/Assets/user_image.jpg"
    }

    QtObject {
        id: algorithm

        function convertIntToChar(integer) {
            let character = integer + 65
            return String.fromCharCode(character)
        }
    }

    Rectangle {
        anchors.fill: parent
        color: UIColors.screen_background
    }

    HeaderScreen {
        width: parent.width
        backBtnText: constant.header_text
        y: constant.header_y
    }

    Item {
        id: content
        width: parent.width - constant.horizontal_align
        anchors.horizontalCenter: parent.horizontalCenter

        TitleScreen {
            id: headerContact
            y: constant.title_y
            textStr: constant.title_screen_text
        }

        SearchInput {
            id: searchContainer
            anchors.top: headerContact.bottom
            anchors.topMargin: UIAligns.margin_50
        }

        Underline {
            id: underline
            width: parent.width
            anchors.top: searchContainer.bottom
            anchors.topMargin: UIAligns.margin_10
        }

        Item {
            id: userInforContainer
            width: parent.width
            anchors {
                top: underline.bottom
                topMargin: UIAligns.margin_15
                horizontalCenter: parent.horizontalCenter
            }
            Image {
                id: userImage
                property bool rounded: true
                width: constant.image_size
                height: constant.image_size

                source: constant.user_image_source

                //layer.enabled: rounded
    //            layer.effect: OpacityMask {
    //                maskSource: Item {
    //                    width: userImage.width
    //                    height: userImage.height
    //                    Rectangle {
    //                        anchors.centerIn: parent
    //                        width: userImage.width
    //                        height: userImage.height
    //                        radius: Math.min(userImage.width, userImage.height)
    //                    }
    //                }
    //            }
            }

            CustomText {
                id: userName
                textStr: constant.name_card_text
                color: UIColors.black
                fontSize: UIFonts.medium_pixel
                fontWeight: UIFonts.medium_weight

                anchors {
                    left: userImage.right
                    leftMargin: UIAligns.margin_25
                    top: parent.top
                    topMargin: UIAligns.margin_10
                }
            }

            CustomText {
                text: constant.my_card_text
                color: UIColors.dark_grey
                fontSize: UIFonts.smallest_pixel


                anchors {
                    top: userName.bottom
                    topMargin: UIAligns.margin_10
                    left: userImage.right
                    leftMargin: UIAligns.margin_25
                }
            }
        }



        ListView {
            id: listContactPhone
            width: parent.width
            height: constant.contact_list_height
            model: ContactController.dataModel

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: userInforContainer.bottom
                topMargin: UIAligns.margin_100
            }

            delegate: ContactItem {
                textStr: model.formatname
                underlineVisible: model.index === ContactController.dataModel.count - 1
            }
        }
    }

    Column {
        id: nameGroupContainer
        width: constant.group_width
        height: constant.group_height
        spacing: constant.group_spacing
        anchors {
            right: parent.right
            rightMargin: UIAligns.margin_10
            top: parent.top
            topMargin: constant.group_margin
        }
        Repeater {
            id: repeaterCharacter
            model: constant.group_model
            Item {
                width: parent.width
                height: constant.item_height
                CustomText {
                    id: groupName
                    height: parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    textStr: algorithm.convertIntToChar(index)
                    color: UIColors.blue
                    fontSize: UIFonts.smallest_pixel
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log(groupName.text)
                    }
                }
            }
        }
    }
}
