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
                padding: 16*app.scaleFactor
                text: qsTr("Start")
                anchors.verticalCenterOffset: -113
                anchors.horizontalCenterOffset: 10
                onClicked:{
                    next();
                }
            }

            Image {
                id: image
                x: 114
                y: 230
                width: 176
                height: 71
                source: "assets/ic_logo.png"
            }
            
            Text {
                id: text1
                x: 86
                y: 119
                width: 302
                height: 44
                color: "#f7f6f6"
                text: qsTr("Find Today's Weather")
                textFormat: Text.RichText
                font.italic: false
                font.bold: true
                font.pixelSize: 30
            }
            
            Image {
                id: image1
                x: 291
                y: 239
                width: 62
                height: 62
                source: "assets/sun (2).png"
            }

            Text {
                id: text2
                x: 179
                y: 174
                color: "#ffffff"
                text: qsTr("with the ")
                font.bold: true
                font.pixelSize: 25
            }
        }
    }
}
