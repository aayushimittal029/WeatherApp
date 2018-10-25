import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

import ArcGIS.AppFramework 1.0
import ArcGIS.AppFramework.Controls 1.0
import Esri.ArcGISRuntime 100.2

import QtPositioning 5.3
import QtSensors 5.3

import "../controls"

MapView{
    id: mapView

    property alias compass: compass

    zoomByPinchingEnabled: true
    rotationByPinchingEnabled: true
    wrapAroundMode: Enums.WrapAroundModeEnabledWhenSupported

    Map{
        id: map
        initUrl: "http://melbournedev.maps.arcgis.com/home/webmap/viewer.html?webmap=24ba3f20e7424c67989e64ec740384f8"
    }

    locationDisplay {
        positionSource: positionSource
        compass: compass
    }

    PositionSource {
        id: positionSource
        active: true
        property bool isInitial: true
        onPositionChanged: {
            if(map.loadStatus === Enums.LoadStatusLoaded && isInitial) {
                isInitial = false;
                zoomToCurrentLocation();
            }
        }
    }


    onSetViewpointCompleted: {
        pointGraphicsOverlay.visible = true;
    }

    Compass {
        id: compass
    }

    function zoomToCurrentLocation(){
        positionSource.update();
        var currentPositionPoint = ArcGISRuntimeEnvironment.createObject("Point", {x: positionSource.position.coordinate.longitude, y: positionSource.position.coordinate.latitude, spatialReference: SpatialReference.createWgs84()});
        var centerPoint = GeometryEngine.project(currentPositionPoint, mapView.spatialReference);
        var viewPointCenter = ArcGISRuntimeEnvironment.createObject("ViewpointCenter",{center: centerPoint, targetScale: 10000});
        mapView.setViewpointWithAnimationCurve(viewPointCenter, 2.0,  Enums.AnimationCurveEaseInOutCubic);
    }

    function zoomToPoint(point){
        var centerPoint = GeometryEngine.project(point, mapView.spatialReference);
        var viewPointCenter = ArcGISRuntimeEnvironment.createObject("ViewpointCenter",{center: centerPoint, targetScale: 10000});
        mapView.setViewpointWithAnimationCurve(viewPointCenter, 4.0,  Enums.AnimationCurveEaseInOutCubic);
    }

    function showPin(point){
        pointGraphicsOverlay.visible = false;
        pointGraphicsOverlay.graphics.remove(0, 1);
        var pictureMarkerSymbol = ArcGISRuntimeEnvironment.createObject("PictureMarkerSymbol", {width: 40*app.scaleFactor, height: 40*app.scaleFactor, url: "../images/pin.png"});
        var graphic = ArcGISRuntimeEnvironment.createObject("Graphic", {geometry: point});
        pointGraphicsOverlay.graphics.insert(0, graphic);
    }
}



