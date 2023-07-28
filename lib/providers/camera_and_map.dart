import 'dart:io';
import 'dart:math';

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

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: PlaceLocation(latitude: 10, longitude: 10, address: 'Teste'),
    );

    _items.add(newPlace);
    notifyListeners();
  }
}
