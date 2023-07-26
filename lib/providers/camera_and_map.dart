import 'package:camera_and_map/models/place.dart';
import 'package:flutter/material.dart';

class CameraAndMap with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place getItem(int index) {
    return _items[index];
  }
}
