import 'dart:io';

import 'package:camera_and_map/components/widgets/image_input.dart';
import 'package:camera_and_map/components/widgets/location_input.dart';
import 'package:camera_and_map/providers/camera_and_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  LatLng _pickedPosition = LatLng(0, 0);

  void _selectImage(File pickedImage) {
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  bool _isValidForm() {
    return _titleController.text.isNotEmpty && _pickedImage != null;
  }

  void _submitForm() {
    if (!_isValidForm()) return;

    Provider.of<CameraAndMap>(context, listen: false)
        .addPlace(
          _titleController.text,
          _pickedImage!,
          _pickedPosition,
        )
        .then((value) => print(
            'Título:${_titleController.text}\nURL_Imagem:${_pickedImage}\nPosição:${_pickedPosition}'));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Novo Local'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (text) {
                          setState(() {});
                        },
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: 'Título',
                        ),
                      ),
                      const SizedBox(height: 10),
                      ImageInput(_selectImage),
                      const SizedBox(height: 10),
                      LocationInput(_selectPosition),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _isValidForm() ? _submitForm : null,
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.secondary,
                ),
                fixedSize: const MaterialStatePropertyAll(Size.fromHeight(37)),
              ),
              icon: const Icon(Icons.add),
              label: const Text('Adicionar'),
            )
          ],
        ),
      ),
    );
  }
}
