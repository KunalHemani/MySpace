import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker(this.imagePickFn);

  final void Function(File pickedImage) imagePickFn;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? pickimage;
  Future getImage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 100, maxWidth: 150);

    if (image == null) return;

    final imagetemp = File(image.path);
    setState(() {
      pickimage = imagetemp;
    });
    widget.imagePickFn(imagetemp);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: pickimage != null ? FileImage(pickimage!) : null,
        ),
        SizedBox(width: 20),
        ElevatedButton.icon(
            onPressed: getImage,
            icon: Icon(Icons.image),
            label: Text("Add Image"),
        ),
      ],
    );
  }
}