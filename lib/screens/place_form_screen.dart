import 'dart:io';

import 'package:camera_and_map/components/widgets/image_input.dart';
import 'package:flutter/material.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {}

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
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          labelText: 'Título',
                        ),
                      ),
                      const SizedBox(height: 10),
                      ImageInput(this._selectImage),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _submitForm,
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.secondary,
                ),
                fixedSize: MaterialStatePropertyAll(Size.fromHeight(37)),
              ),
              icon: Icon(Icons.add),
              label: Text('Adicionar'),
            )
          ],
        ),
      ),
    );
  }
}
