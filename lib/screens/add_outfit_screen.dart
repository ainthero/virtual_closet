import 'package:flutter/material.dart';
import 'package:wardrobe/models/accessory.dart';
import '../models/clothing_item.dart';
import '../models/outfit.dart';
import '../widgets/outfit_accessory_widget.dart';

class AddOutfitScreen extends StatefulWidget {
  @override
  _AddOutfitScreenState createState() => _AddOutfitScreenState();
}

class _AddOutfitScreenState extends State<AddOutfitScreen> {
  final TextEditingController shoesController = TextEditingController();
  final TextEditingController topController = TextEditingController();
  final TextEditingController bottomController = TextEditingController();
  final TextEditingController accessoryController = TextEditingController();
  List<Accessory> accessories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Outfit'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: shoesController,
              decoration: InputDecoration(labelText: 'Shoes'),
            ),
            TextField(
              controller: topController,
              decoration: InputDecoration(labelText: 'Top'),
            ),
            TextField(
              controller: bottomController,
              decoration: InputDecoration(labelText: 'Bottom'),
            ),
            ElevatedButton(
              onPressed: () {
                final newOutfit = Outfit(
                  shoes: ClothingItem(
                    image: 'path_to_image', // Replace with actual path to image
                    size: shoesController.text,
                    label: 'Shoes',
                  ),
                  top: ClothingItem(
                    image: 'path_to_image', // Replace with actual path to image
                    size: topController.text,
                    label: 'Top',
                  ),
                  bottom: ClothingItem(
                    image: 'path_to_image', // Replace with actual path to image
                    size: bottomController.text,
                    label: 'Bottom',
                  ),
                  accessories: accessories,
                );
                Navigator.of(context).pop(newOutfit);
              },
              child: Text('Add'),
            ),
            SizedBox(height: 16.0),
            Text('Accessories'),
            TextField(
              controller: accessoryController,
              decoration: InputDecoration(labelText: 'Accessory'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  accessories.add(
                    Accessory(
                      image: 'path_to_image', // Replace with actual path to image
                      label: 'Accessory',
                    ),
                  );
                  accessoryController.clear();
                });
              },
              child: Text('Add Accessory'),
            ),
            Column(
              children: accessories.map((accessory) => OutfitAccessoryWidget(accessory: accessory)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
