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
import './controls'
import './views'
Item {
    signal next();
    signal back();
    width: 421
    height: 750
    property alias rectanglemain: rectanglemain
    z: -2147483647
    // App Page
    Page{
        width: 421
        height: 750
        z: 1
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        // Adding App Page Header Section

        header: ToolBar{
            id:header
            width: 421
            contentHeight: 56 * app.scaleFactor
            Material.primary: app.primaryColor
            RowLayout{
                anchors.leftMargin: 16
                anchors.fill: parent
                spacing:0
                Item{
                    Layout.preferredWidth: 4*app.scaleFactor
                    Layout.fillHeight: true
                }
                ToolButton {
                    indicator: Image{
                        width: parent.width*0.5
                        height: parent.height*0.5
                        anchors.centerIn: parent
                        source: "./assets/back.png"
                        fillMode: Image.PreserveAspectFit
                        mipmap: true
                    }
                    onClicked:{
                        // Go back previous page
                        back();
                    }
                }
                Item{
                    Layout.preferredWidth: 20*app.scaleFactor
                    Layout.fillHeight: true
                }
                Label {
                    Layout.fillWidth: true
                    text: qsTr("Page 1")
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
            id: rectanglemain
            width: 330


            Rectangle {
                id: rectangle
                width: 330
                height: 712
                color: "#00bfff"
                anchors.bottomMargin: -8
                anchors.leftMargin: 8
                anchors.topMargin: 8
                anchors.rightMargin: -79
                anchors.fill: parent








                Text {
                    id: text20
                    x: 145
                    y: 114
                    width: 88
                    height: 39
                    text: qsTr("Today")
                    font.pixelSize: 22

                    Rectangle {
                        id: rectangle2
                        x: -135
                        y: -107
                        width: 382
                        height: 239
                        color: "#4169e1"
                        z: 1
                    }
                }


                Rectangle {
                    id: rectangle4
                    x: -8
                    y: -47
                    width: 421
                    height: 750
                    color: "#1e90ff"
                    z: -1
                }





                Button{
                    x: 138
                    y: 141
                    width: 114
                    height: 14
                    Material.elevation :10
                    font.pixelSize: app.titleFontSize
                    //font.bold: true
                    //wrapMode: Text.Wrap
                    padding: 16*app.scaleFactor
                    text: qsTr("Open in  maps")
                    onClicked:{
                        next();
                    }

                    Text {
                        id: text1
                        x: -101
                        y: 43
                        width: 101
                        height: 29
                        text: qsTr("San Jose")
                        font.family: "Arial"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 17
                    }
                }












                Button {
                    id: getEverything
                    x: 145
                    y: 159
                    text: qsTr("Open in maps")
                    onClicked: {

                        var coordinates = []

                        request('http://api.openweathermap.org/data/2.5/weather?q=San Jose,us&appid=668f6d8c77a2d45bc2e5e2d601c838e2&units=imperial', function (o) {
                            console.log(o.responseText);
                            var d = eval('new Object(' + o.responseText + ')');
                            text20.text = d.main.temp + " \xB0 F"
                            text21.text = d.main.temp_max + " \xB0 F"
                            text22.text = d.main.temp_min + " \xB0 F"
                            image1.source = "assets/clouds.png"
                            coordinates[0] = d.coord.lon
                            coordinates[1] = d.coord.lat
                            getForcastData(coordinates);
                        });
                        function getForcastData(coordinates){
                            var forecastUrl = "http://api.openweathermap.org/data/2.5/forecast?lat="+ coordinates[1] + "&lon=" + coordinates[0] +"&appid=668f6d8c77a2d45bc2e5e2d601c838e2&units=imperial"
                            console.log(forecastUrl);
                            var forecasts = [];var k =0;
                            request(forecastUrl, function (o) {

                                var forecastData = new Object();
                                var days = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
                                var d = eval('new Object(' + o.responseText + ')');
                                for(var i =0; i< d.list.length ;i ++ ){
                                    var subData = d.list[i];
                                    var temp = subData.dt_txt.split(" ")[0];
                                    if(!forecastData[temp]){
                                        forecastData[temp] = subData;
                                        forecastData[temp].dayOfWeek = days[new Date(temp).getDay()];
                                        forecastData[temp].date = temp;
                                        forecasts[k++]= forecastData[temp];
                                    }
                                    else {
                                        if(forecastData[temp].main.temp_min > subData.main.temp_min)
                                            forecastData[temp].main.temp_min = subData.main.temp_min;

                                        if(forecastData[temp].main.temp_max < subData.main.temp_max)
                                            forecastData[temp].main.temp_max = subData.main.temp_max;
                                    }
                                };

                                fillForcastTexts(forecasts);
                            });
                        };
                        function fillForcastTexts(forecasts){
                            text2.text = forecasts[0].dayOfWeek + " (" + forecasts[0].date + ")"
                            text8.text = forecasts[0].main.temp_max
                            text9.text = forecasts[0].main.temp_min
                            text23.text = forecasts[0].weather[0].description


                            text3.text = forecasts[1].dayOfWeek + " (" + forecasts[1].date + ")"
                            text10.text = forecasts[1].main.temp_max
                            text11.text = forecasts[1].main.temp_min
                            text24.text = forecasts[0].weather[1].description

                            text4.text = forecasts[2].dayOfWeek + " (" + forecasts[2].date + ")"
                            text12.text = forecasts[2].main.temp_max
                            text13.text = forecasts[2].main.temp_min
                            text25.text = forecasts[0].weather[2].description

                            text5.text = forecasts[3].dayOfWeek + " (" + forecasts[3].date + ")"
                            text14.text = forecasts[3].main.temp_max
                            text15.text = forecasts[3].main.temp_min
                            text26.text = forecasts[0].weather[3].description

                            text6.text = forecasts[4].dayOfWeek + " (" + forecasts[4].date + ")"
                            text16.text = forecasts[4].main.temp_max
                            text17.text = forecasts[4].main.temp_min
                            text27.text = forecasts[0].weather[4].description

                        }
                        function request(url, callback) {
                            var xhr = new XMLHttpRequest();
                            xhr.onreadystatechange = (function(myxhr) {
                                return function() {
                                    if(xhr.readyState === 4) callback(myxhr)
                                }
                            })(xhr);
                            xhr.open('GET', url, true);
                            xhr.send('');
                        }
                    }
                }

                Image {
                    id: image1
                    x: 276
                    y: 38
                    width: 61
                    height: 54
                    source: "assets/sun (2).png"
                }













                Rectangle {
                    id: rectangle1
                    x: 11
                    y: 246
                    width: 379
                    height: 431
                    color: "#ffffff"

                    Image {
                        id: image2
                        x: 23
                        y: 28
                        width: 50
                        height: 50
                        source: "assets/sunny.png"
                    }

                    Image {
                        id: image5
                        x: 23
                        y: 267
                        width: 50
                        height: 50
                        source: "assets/storm.png"
                    }

                    Image {
                        id: image3
                        x: 23
                        y: 111
                        width: 50
                        height: 50
                        source: "assets/cloudy.png"
                    }

                    Image {
                        id: image4
                        x: 23
                        y: 191
                        width: 50
                        height: 50
                        source: "assets/clouds.png"
                    }

                    Image {
                        id: image6
                        x: 23
                        y: 348
                        width: 50
                        height: 50
                        source: "assets/snow.png"
                    }

                    Text {
                        id: text2
                        x: 93
                        y: 32
                        text: qsTr("Sunny")
                        font.pixelSize: 15
                    }

                    Text {
                        id: text3
                        x: 94
                        y: 118
                        width: 48
                        height: 19
                        text: qsTr("Cloudy")
                        font.pixelSize: 15
                    }

                    Text {
                        id: text4
                        x: 95
                        y: 191
                        text: qsTr("Cloudy")
                        font.pixelSize: 15
                    }

                    Text {
                        id: text5
                        x: 96
                        y: 270
                        text: qsTr("Rain")
                        font.pixelSize: 15
                    }

                    Text {
                        id: text6
                        x: 93
                        y: 348
                        text: qsTr("Light Snow")
                        font.pixelSize: 15
                    }

                    Text {
                        id: text8
                        x: 247
                        y: 44
                        text: qsTr("Text")
                        font.pixelSize: 21
                    }

                    Text {
                        id: text9
                        x: 311
                        y: 47
                        color: "#808080"
                        text: qsTr("Text")
                        font.capitalization: Font.MixedCase
                        font.pixelSize: 21
                    }

                    Text {
                        id: text10
                        x: 247
                        y: 128
                        text: qsTr("Text")
                        font.pixelSize: 21
                    }

                    Text {
                        id: text11
                        x: 311
                        y: 129
                        color: "#808080"
                        text: qsTr("Text")
                        font.pixelSize: 21
                    }

                    Text {
                        id: text12
                        x: 246
                        y: 205
                        text: qsTr("Text")
                        font.pixelSize: 21
                    }

                    Text {
                        id: text13
                        x: 313
                        y: 206
                        color: "#808080"
                        text: qsTr("Text")
                        font.pixelSize: 21
                    }

                    Text {
                        id: text14
                        x: 247
                        y: 277
                        width: 41
                        height: 25
                        text: qsTr("Text")
                        font.pixelSize: 21
                    }

                    Text {
                        id: text15
                        x: 309
                        y: 278
                        height: 25
                        color: "#808080"
                        text: qsTr("Text")
                        font.pixelSize: 21
                    }


                    Text {
                        id: text16
                        x: 247
                        y: 352
                        text: qsTr("Text")
                        font.pixelSize: 21
                    }

                    Text {
                        id: text17
                        x: 313
                        y: 351
                        color: "#a9a9a9"
                        text: qsTr("Text")
                        font.pixelSize: 21
                    }

                    Text {
                        id: text23
                        x: 94
                        y: 52
                        color: "#808080"
                        text: qsTr("Text")
                        font.pixelSize: 15
                    }

                    Text {
                        id: text24
                        x: 96
                        y: 139
                        color: "#808080"
                        text: qsTr("Text")
                        font.pixelSize: 15
                    }

                    Text {
                        id: text25
                        x: 96
                        y: 212
                        color: "#808080"
                        text: qsTr("Text")
                        font.pixelSize: 15
                    }

                    Text {
                        id: text26
                        x: 96
                        y: 292
                        color: "#808080"
                        text: qsTr("Text")
                        font.pixelSize: 15
                    }

                    Text {
                        id: text27
                        x: 95
                        y: 371
                        color: "#808080"
                        text: qsTr("Text")
                        font.pixelSize: 15
                    }






                }









                Text {
                    id: text21
                    x: 308
                    y: 141
                    text: qsTr("Max")
                    font.pixelSize: 21
                }





                Text {
                    id: text22
                    x: 311
                    y: 190
                    text: qsTr("Min")
                    font.pixelSize: 21
                }








            }

            Image {
                id: image
                x: 57
                y: 20
                width: 229
                height: 100
                source: "assets/ic_logo.png"
            }

        }


    }
}
