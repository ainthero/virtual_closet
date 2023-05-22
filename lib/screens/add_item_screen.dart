import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wardrobe/globals.dart';
import '../models/clothing_item.dart';

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController labelController = TextEditingController();
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _image != null
                ? Image.file(
              _image!,
              height: 150,
            )
                : Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Icon(Icons.camera_alt),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.camera),
                  child: Text('Take Photo'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  child: Text('Choose Photo'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: sizeController,
              decoration: InputDecoration(labelText: 'Size'),
            ),
            TextField(
              controller: labelController,
              decoration: InputDecoration(labelText: 'Label'),
            ),
            ElevatedButton(
              onPressed: () {
                final newItem = ClothingItem(
                  image: _image?.path,
                  size: sizeController.text,
                  label: labelController.text,
                );
                Global.clothes.add(newItem);
                Navigator.of(context).pop(newItem);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
