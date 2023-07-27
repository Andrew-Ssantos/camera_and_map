import 'package:camera_and_map/components/widgets/image_input.dart';
import 'package:flutter/material.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Novo Local'),
      ),
      body: const Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Título',
            ),
          ),
          ImageInput(),
        ],
      ),
    );
  }
}
