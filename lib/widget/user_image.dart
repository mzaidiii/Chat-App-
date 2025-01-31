import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserInputImage extends StatefulWidget {
  const UserInputImage({super.key, required this.onpickedImage});
  final void Function(File pickedImage) onpickedImage;

  @override
  State<UserInputImage> createState() {
    return _UserInputImage();
  }
}

class _UserInputImage extends State<UserInputImage> {
  File? _imagePicker;

  void inputImage() async {
    final _pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 60, maxWidth: 150);
    if (_pickedImage == null) {
      return;
    }
    setState(() {
      _imagePicker = File(_pickedImage.path);
    });

    widget.onpickedImage(_imagePicker!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage:
              _imagePicker != null ? FileImage(_imagePicker!) : null,
        ),
        TextButton.icon(
            onPressed: inputImage,
            icon: Icon(Icons.image),
            label: Text(
              'Add Image',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ))
      ],
    );
  }
}
