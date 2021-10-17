// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unnecessary_this

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'searchForm.dart';
import 'package:location/location.dart';
import 'map.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tabs()
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({ Key? key }) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Map()
        ),
        Container(
          alignment: Alignment.topCenter,
          child: SearchFormWidget(),
          ),
      ],
      
    );
  }
}
class Tabs extends StatefulWidget {
  Tabs({Key? key}) : super(key: key);
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Title')),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.filter_list),
              tooltip: 'filter',
              onPressed: () {},
            )
          ],
        ),
        body: HomeContent(),
        bottomNavigationBar: BottomNavigationBar(

          currentIndex: this._currentIndex,
          onTap: (int index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.map), 
              label: "Map View"
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_numbered), 
              label: "List View"
            )
          ],
        ),
      );
  }
}
