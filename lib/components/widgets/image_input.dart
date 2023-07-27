import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: const Text('Nenhuma imagem!'),
        ),
        const SizedBox(width: 10),
        OutlinedButton.icon(
          style: const ButtonStyle(
            padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 30,
              ),
            ),
          ),
          onPressed: () {},
          icon: const Icon(Icons.camera_alt),
          label: const Text('Tirar foto'),
        ),
      ],
    );
  }
}
