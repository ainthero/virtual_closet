import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wardrobe/globals.dart';
import '../models/clothing_item.dart';
import '../models/outfit.dart';

class CreateOutfitScreen extends StatefulWidget {
  @override
  _CreateOutfitScreenState createState() => _CreateOutfitScreenState();
}

class _CreateOutfitScreenState extends State<CreateOutfitScreen> {
  String outfitLabel = '';
  List<ClothingItem> selectedClothes = [];

  void _addClothingItem(ClothingItem clothingItem) {
    setState(() {
      selectedClothes.add(clothingItem);
    });
  }

  Outfit _createOutfit() {
    // Create an instance of the Outfit class with the entered label and selected clothes
    Outfit newOutfit = Outfit(label: outfitLabel, items: selectedClothes);
    Global.outfits.add(newOutfit);
    // Do something with the new outfit, such as saving it to a database or displaying it on another screen
    return newOutfit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Outfit'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  outfitLabel = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Outfit Label',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClothesListScreen(
                      onClothingItemAdded: _addClothingItem,
                    ),
                  ),
                );
              },
              child: Text('Add Clothing Item'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Selected Clothes:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: selectedClothes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                      width: 80.0,
                      height: 80.0,
                      child: Image.file(
                        File(selectedClothes[index].image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(selectedClothes[index].label),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var newOutfit = _createOutfit();
                Navigator.of(context).pop(newOutfit);
              },
              child: Text('Create Outfit'),
            ),
          ],
        ),
      ),
    );
  }
}

class ClothesListScreen extends StatelessWidget {
  final Function(ClothingItem) onClothingItemAdded;

  ClothesListScreen({required this.onClothingItemAdded});

  // Replace with your actual list of clothing items
  final List<ClothingItem> clothesList = Global.clothes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothes List'),
      ),
      body: ListView.builder(
        itemCount: clothesList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: SizedBox(
              width: 80.0,
              height: 80.0,
              child: Image.file(
                File(clothesList[index].image!),
                fit: BoxFit.cover,
              ),
            ),
            title: Text(clothesList[index].label),
            onTap: () {
              onClothingItemAdded(clothesList[index]);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
