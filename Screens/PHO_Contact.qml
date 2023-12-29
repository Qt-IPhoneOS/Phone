import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import QML.Constants
import QML.Components
import "Common"
import "Common/Items"

Item {
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
        id: header
        width: parent.width
        backBtnText: "Lists"

        Image {
            y: 20
            width: 30
            height: 30
            source: "qrc:/Assets/plus_icon.png"
            anchors {
                right: parent.right
                rightMargin: 20
            }
        }
    }

    RootScreen {
        id: content
        width: parent.width - constant.horizontal_align
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        contentHeight: listContactPhone.height + headerContact.height + searchContainer.height + userInforContainer.height + 280

        onContentYChanged: {
            if (contentY > 20) {
                header.enableHeader = true
                header.headerText = "Contacts"
            }
            else {
                header.enableHeader = false
                header.headerText = ""
            }
        }

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
                sourceImg: "qrc:/Assets/Avatar/avartarUser.jpg"
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
            height: ContactController.dataModel.count * 50 + ContactController.headingCount * 50

            model: ContactController.dataModel
            interactive: false

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: userInforContainer.bottom
                topMargin: UIAligns.margin_70
            }

            delegate: Item {
                id: contactItem
                width: parent.width
                height: section.height + contact.height

                Item {
                    id: section
                    width: parent.width
                    height: model.isHeading ? 50 : 0

                    CustomText {
                        x: 2
                        y: 23
                        visible: model.isHeading
                        color: UIColors.grey
                        text: model.section
                        fontWeight: UIFonts.medium_weight
                    }
                }

                ContactItem {
                    id: contact
                    textStr: model.formatname
                    anchors.top: section.bottom
                }
            }
        }

        CustomText {
            width: parent.width
            height: 50
            color: UIColors.black
            text: ContactController.dataModel.count + " Contacts"
            fontWeight: UIFonts.medium_weight
            anchors.top: listContactPhone.bottom
            anchors.topMargin: 20
            horizontalAlignment: Text.AlignHCenter
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
