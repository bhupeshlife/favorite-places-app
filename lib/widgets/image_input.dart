import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInputScreen extends StatefulWidget {
  const ImageInputScreen({super.key});

  @override
  State<ImageInputScreen> createState() => _ImageInputScreenState();
}

class _ImageInputScreenState extends State<ImageInputScreen> {
  File? _selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      icon: const Icon(
        Icons.camera,
      ),
      label: const Text('Take Picture'),
    );

    if (_selectedImage != null) {
      content = Image.file(
        _selectedImage!,
        fit: BoxFit.cover,
        // width: double.infinity,
        // height: double.infinity,
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      height: 200,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }
}
