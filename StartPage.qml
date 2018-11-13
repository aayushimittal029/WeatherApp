/* Copyright 2017 Esri
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Controls 2.4

Item {
    signal next();
    signal back();
    // App Page
    Page{
        anchors.fill: parent
        // Adding App Page Header Section
        header: ToolBar{
            id:header
            contentHeight: 56 * app.scaleFactor
            Material.primary: app.primaryColor

            RowLayout{
                anchors.fill: parent
                spacing:0
                Item{
                    Layout.preferredWidth: 16*app.scaleFactor
                    Layout.fillHeight: true
                }

                Label {
                    Layout.fillWidth: true
                    text: qsTr("Start Page")
                    elide: Label.ElideRight
                    horizontalAlignment: Qt.AlignLeft
                    verticalAlignment: Qt.AlignVCenter
                    font.pixelSize: app.titleFontSize
                    color: app.headerTextColor
                }               
            }
        }
        // Header Section ends    

        // Page Body
        // TODO:-Provide Code here to add items to the Page
        // Button to navigate to next page
        Rectangle{
            width: 627
            height: 428
            color: "#4169e1"
            anchors.rightMargin: 0
            anchors.bottomMargin: -218
            anchors.fill: parent


            Button{
                width: 90
                height: 34
                Material.elevation :10
                anchors.centerIn: parent
                font.pixelSize: app.titleFontSize
                //font.bold: true
                //wrapMode: Text.Wrap
                text: qsTr("Start")
                padding: 1
                anchors.verticalCenterOffset: 94
                anchors.horizontalCenterOffset: 0
                onClicked:{
                    next();
                }
            }

            Image {
                id: image
                x: 115
                y: 454
                width: 176
                height: 71
                source: "assets/ic_logo.png"
            }
            
            Text {
                id: text1
                x: 67
                y: 102
                width: 260
                height: 44
                color: "#f7f6f6"
                text: qsTr("Find Weather with")
                horizontalAlignment: Text.AlignHCenter
                textFormat: Text.RichText
                font.italic: false
                font.bold: true
                font.pixelSize: 30
            }
            
            Image {
                id: image1
                x: 77
                y: 226
                width: 202
                height: 222
                source: "assets/Zeus copy.png"
            }

            Text {
                id: text2
                x: 67
                y: 140
                color: "#f7f6f6"
                text: qsTr("God of Weather the
Zeus")
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                font.pixelSize: 30
            }
        }
    }
}
