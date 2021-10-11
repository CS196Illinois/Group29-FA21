import 'package:flutter/material.dart';

class Event {
  Image? image;
  String name;
  String location;
  DateTime date;
  String description;

  Event(
      {this.image,
      required this.name,
      required this.location,
      required this.date,
      required this.description});
}
