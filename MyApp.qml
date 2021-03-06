﻿/* Copyright 2018 Esri
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


// You can run your app in Qt Creator by pressing Alt+Shift+R.
// Alternatively, you can run apps through UI using Tools > External > AppStudio > Run.
// AppStudio users frequently use the Ctrl+A and Ctrl+I commands to
// automatically indent the entirety of the .qml file.


import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0

import ArcGIS.AppFramework 1.0
import ArcGIS.AppFramework.Controls 1.0

App{
    id: app
    width: 421
    height: 750

    readonly property color primaryColor:"#3F51B5"
    readonly property color accentColor: Qt.lighter(primaryColor,1.2)
    readonly property color headerTextColor: "#ffffff"
    readonly property color buttonBackgroundColor: Material.accent
    readonly property color buttonTextColor: "#ffffff"

    property real scaleFactor: AppFramework.displayScaleFactor
    readonly property real baseFontSize: app.width < 450*app.scaleFactor? 21 * scaleFactor:23 * scaleFactor
    readonly property real titleFontSize: app.baseFontSize
    readonly property real subtitleFontSize: 1.1 * app.baseFontSize
    property alias stackView: stackView
    
    
    StackView {
        id: stackView
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        initialItem: startPage
        
        Text {
            id: text1
            x: 59
            y: 136
            text: qsTr("Temperatue")
            font.pixelSize: 12
        }
        
        Image {
            id: image
            x: 187
            y: 87
            width: 100
            height: 100
            source: "qrc:/qtquickplugin/images/template_image.png"
        }
    }

    Component {
        id: startPage
        StartPage{
            onNext: {
                stackView.push(page1);
            }
        }
    }

    Component {
        id: page1
        Page1{
            onNext: {
                stackView.push(page2);
            }
            onBack: {
                stackView.pop();
            }
        }
    }

    Component{
        id: page2
        Page2{
            onBack: {
                stackView.pop();
            }
        }
    }

    Keys.onReleased: {
        event.accepted = true
        if (event.key === Qt.Key_Back || event.key === Qt.Key_Escape){
            if(stackView.depth>1) stackView.pop();
        }
    }
}






