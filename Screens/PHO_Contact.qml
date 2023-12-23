import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import QML.Constants
import QML.Components
import "Common"
import "Common/Items"

RootScreen {
    id: rootItem

    QtObject {
        id: constant

        readonly property int horizontal_align: 70
        readonly property int contact_list_height: 535
    }

    QtObject {
        id: algorithm

        function convertIntToChar(integer) {
            let character = integer + 65
            return String.fromCharCode(character)
        }
    }

    HeaderScreen {
        y: 30
        width: parent.width
        backBtnText: "Lists"
    }

    Item {
        id: content
        width: parent.width - constant.horizontal_align
        anchors.horizontalCenter: parent.horizontalCenter

        TitleScreen {
            id: headerContact
            y: 70
            textStr: "Contacts"
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

            Avatar {
                id: userImage
                width: 65
                height: 65
                sourceImg: "qrc:/Assets/avartarUser.jpg"
            }

            CustomText {
                id: userName
                textStr: "Me"
                color: UIColors.black
                fontSize: UIFonts.medium_pixel
                fontWeight: UIFonts.medium_weight

                anchors {
                    left: userImage.right
                    leftMargin: UIAligns.margin_25
                    top: parent.top
                    topMargin: UIAligns.margin_5
                }
            }

            CustomText {
                text: "My Card"
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
        width: 10
        height: 400
        spacing: 5
        anchors {
            right: parent.right
            rightMargin: UIAligns.margin_10
            top: parent.top
            topMargin: 250
        }
        Repeater {
            id: repeaterCharacter
            model: 26
            Item {
                width: parent.width
                height: 10
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
