import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterdemoprojectapp/googleMap/google_map_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapActivity extends StatefulWidget {
  @override
  _GoogleMapActivityState createState() => _GoogleMapActivityState();
}

class _GoogleMapActivityState extends State<GoogleMapActivity> {
  bool loading = true;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLines = {};
  GoogleMapService googleMapService=GoogleMapService();
  Set<Polyline> get polyLines =>_polyLines;
  Completer<GoogleMapController> _completerController=Completer();
  LocationData locationData;
  static LatLng latLng;
  double lat;
  double log;

  @override
  void initState() {
    setState(() {
      getLocation();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google App'),),
      body:latLng!=null ? GoogleMap(
        polylines: polyLines,
        markers: _markers,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: latLng,
          zoom: 14.4748
        ),
        myLocationEnabled: true,
        onCameraMove: onCameraMove,
        onMapCreated: (GoogleMapController controller){
          _completerController.complete(controller);
        },
      ): CircularProgressIndicator(),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Destination'),
        icon: Icon(Icons.directions_boat),
        onPressed: (){
          sendRequest();
        },
      ),
    );

  }

  getLocation() async{
    var location=new Location();
    location.onLocationChanged().listen((currentLocation) {
      print(currentLocation.latitude);
      print(currentLocation.longitude);

      log=currentLocation.longitude;
      lat=currentLocation.latitude;
      setState(() {
        latLng=LatLng(currentLocation.latitude, currentLocation.longitude);
      });

      print("getLocation : $latLng");
      _onAddMarkerButtonPressed();
      setState(() {
        loading = false;
      });
    });
  }

  void _onAddMarkerButtonPressed(){
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId("111"),
          position: latLng,
          icon: BitmapDescriptor.defaultMarker
      ));
    });
  }


  void onCameraMove(CameraPosition position) {
    latLng = position.target;
  }

  void sendRequest() async{
    LatLng destination=LatLng(lat,log);
    String route=await googleMapService.getGoogleMap(latLng, destination);
    createRoute(route);
    _addMarker(destination,"KTHM Collage");
  }

  void createRoute(String route) {
    _polyLines.add(Polyline(
      polylineId: PolylineId(latLng.toString()),
      width: 4,
      points: _convertToLatLng(_decodePoly(route))
    ));
  }

  void _addMarker(LatLng destination, String address) {
     _markers.add(Marker(markerId: MarkerId("112"),
     position: destination,
     infoWindow: InfoWindow(title: address,snippet: "go here"),
     icon: BitmapDescriptor.defaultMarker
     ));
  }


  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  List _decodePoly(String poly) {
    var list=poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
    do{
      var shift = 0;
      int result = 0;

      do{
        c=list[index]-63;
        result |=(c & 0x1F) << (shift*5);
        index++;
        shift++;

      }while(c>=32);
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1=(result>>1) * 0.00001;
      lList.add(result1);
      }while(index<len);

    for (var i = 2; i < lList.length; i++){
       lList[i]+=lList[i-2];
     }


    print(lList.toString());

    return lList;
  }
}
