import 'package:camera_and_map/screens/place_form_screen.dart';
import 'package:camera_and_map/screens/place_list_screen.dart';
import 'package:camera_and_map/utils/app_routes.dart';
import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera and Map',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink).copyWith(
          primary: Colors.pink,
          secondary: Colors.lightGreen.shade400,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: PlaceListScreen(),
      routes: {
        AppRoutes.PLACE_FORM: (context) => const PlaceFormScreen(),
      },
    );
  }
}
