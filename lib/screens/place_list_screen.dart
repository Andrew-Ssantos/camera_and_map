import 'package:camera_and_map/providers/camera_and_map.dart';
import 'package:camera_and_map/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meus Locais'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Consumer<CameraAndMap>(
        child: const Center(
          child: Text('Nenhum local cadastrado!'),
        ),
        builder: (ctx, cameraAndMap, child) => cameraAndMap.itemsCount == 0
            ? child!
            : ListView.builder(
                itemCount: cameraAndMap.itemsCount,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        FileImage(cameraAndMap.itemByIndex(i).image),
                  ),
                  title: Text(cameraAndMap.itemByIndex(i).title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
