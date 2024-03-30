import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myspace_final/services/database.dart';
import 'package:myspace_final/widgets/widget_support.dart';
import 'package:random_string/random_string.dart';

class Addworkspace extends StatefulWidget {
  const Addworkspace({Key? key}) : super(key: key);

  @override
  State<Addworkspace> createState() => _AddworkspaceState();
}

class _AddworkspaceState extends State<Addworkspace> {
  final List<String> workspaceItems = ['Below 299', 'Below 399', 'Below 499'];
  String? selectedCategory;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future<void> getImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  Future<void> uploadItem() async {
    if (selectedImage != null &&
        nameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        detailController.text.isNotEmpty &&
        selectedCategory != null) {
      final String addId = randomAlphaNumeric(10);

      final Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("blogImages").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      final downloadUrl = await (await task).ref.getDownloadURL();

      final Map<String, dynamic> addItem = {
        "Image": downloadUrl,
        "Name": nameController.text,
        "Price": priceController.text,
        "Detail": detailController.text
      };
      await DatabaseMethods().addWorkspaceItem(addItem, selectedCategory!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Desk has been added Successfully",
            style: TextStyle(fontSize: 18.0),
          ),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF373866),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add WorkSpace",
          style: AppWidget.headerTextFieldStyle(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Upload the Picture",
              style: AppWidget.boldTextFieldStyle(),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: getImage,
              child: selectedImage == null
                  ? Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black,
                ),
              )
                  : Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    selectedImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Office Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: "Rent Price",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: detailController,
              maxLines: 6,
              decoration: InputDecoration(
                labelText: "Office  Details",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: InputDecoration(
                labelText: "Price Category",
                border: OutlineInputBorder(),
              ),
              items: workspaceItems
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(fontSize: 18.0),
                ),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: uploadItem,
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}