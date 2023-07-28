import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  const ImageInput(this.onSelectImage, {super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    XFile imageFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    setState(() => _storedImage = File(imageFile.path));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          height: 239,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : const Text('Nenhuma imagem!'),
        ),
        // const SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            style: const ButtonStyle(
              iconSize: MaterialStatePropertyAll(28),
              padding:
                  MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15)),
            ),
            onPressed: _takePicture,
            icon: const Icon(Icons.camera_alt),
            label: const Text(
              'Tirar foto',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
