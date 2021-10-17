// ignore_for_file: unused_import, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'searchForm.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: _center,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        ),
        /*Positioned(
          right: 30,
          bottom: 40,
          child: IconButton(
            icon: Icon(
              Icons.gps_fixed,
              size: 50.0 ,
              color: Colors.lightBlue[600],
              ), 
            onPressed: () {}
          ),
        ),*/
      ],
    );
  }
}

/*
GoogleMapController mapController;
  LocationData currentLocation;
  Location location;
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  CameraPosition _center =
      CameraPosition(target: SOURCE_LOCATION, zoom: CAMERA_ZOOM);
  bool isLoading = false;

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
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
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
    if (_permissionGranted == PermissionStatus.DENIED) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.GRANTED) {
        return;
      }
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Map'),
        centerTitle: true,
      ),
      body: isLoading
          ? CircularProgressIndicator()
          : Container(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: _center,
                myLocationEnabled: true,
              ),
            ),
    );
  }
  */


  /*
   static const _initialCameraposition =  CameraPosition(
    target: LatLng(40.10722, -88.22806),
    zoom: 11.5,
  );


  late GoogleMapController _googleMapController;
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  
  */