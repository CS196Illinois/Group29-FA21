// ignore_for_file: unused_import, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:async';
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'searchForm.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_core/firebase_core.dart';

const double CAMERA_ZOOM = 16;
const LatLng SOURCE_LOCATION = LatLng(40.10722, -88.22806);
class Map extends StatefulWidget {

  Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  late GoogleMapController mapController;
  late LocationData currentLocation;
  late Location location;
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  CameraPosition _center =
      CameraPosition(target: SOURCE_LOCATION, zoom: CAMERA_ZOOM);
  bool isLoading = false;

  Set<Marker> _markers = {    };

  @override
  void initState() {
    super.initState();
    location = new Location();
    _getLocation();
  }

  _getLocation() async {
    setState(() {
      isLoading = true;
    });
    initialize();
    currentLocation = await location.getLocation();
    if (currentLocation == null) {
      return;
    }
    _center = CameraPosition(
        target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        zoom: CAMERA_ZOOM);

    setState(() {
      isLoading = false;
    });

    print("CurrentLocation: $currentLocation");
  }

  Future<void> initialize() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("events").snapshots(),
        builder:(context, AsyncSnapshot<QuerySnapshot> snapshot) {
          
          GeoPoint location = snapshot.data!.docs.first.get('LatLng');
          final latLng = LatLng(location.latitude, location.longitude);
          _markers.add(
            Marker(
              markerId: MarkerId("location"), 
              position: latLng,
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
              draggable: false,
              infoWindow: InfoWindow(
                title: snapshot.data!.docs.first.get('name'),
                snippet: snapshot.data!.docs.first.get('description'),
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder:(context) => const AddInfo()),
                  );
                }
              ),
            )
          );
          return Stack(
            children: [
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: _center,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onLongPress: _addMarker,
                markers: (_markers), 
              ),       
            ],
          );
        }
      ) 
    );
    
  }



  void _addMarker(LatLng pos) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(pos.toString()),
          position: pos,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          draggable: false,
          infoWindow: InfoWindow(
            title: "My activity",
            snippet: "click to add more info",
            onTap: () {
            showModalBottomSheet<void>(
                context: context,
            builder: (BuildContext context) {
              return Container(
                child: Wrap(
                  children: <Widget>[

                    ListTile(
                      leading: Icon(Icons.add),
                      title: Text('Add information'),
                      onTap: (){
                        //Navigator.pop(context);
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder:(context) => const AddInfo()),
                        );
                      }     
                    ),

                    ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Remove marker'),
                      onTap: () =>
                      {
                        setState(() {
                          _markers.remove(_markers.firstWhere((Marker marker) 
                            => marker.markerId.value == pos.toString()));
                          Navigator.pop(context);
                        })
                      }
                    ),
                    //ListTile(),
                  ],
                ),
              );
            });
          },
          ),
        )
      );
    });
  }
  }
class AddInfo extends StatelessWidget {
  const AddInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Your Activity Info"),
      ),
      
    );
  }
}




/*
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("events").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            //Extract the location from document
            GeoPoint location = snapshot.data!.docs.first.get('location');
            // Check if location is valid
            if (location == null) {
              return Text("There was no location data");
            }
            final latLng = LatLng(location.latitude, location.longitude);

            // Add new marker with markerId.
            _markers.add(Marker(markerId: MarkerId("location"), position: latLng));

            return Stack(
              children: [
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: _center,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onLongPress: _addMarker,
                  markers: (_markers), 
                ),       
              ],
            );
          }
        },
      ),
    );
  }

*/