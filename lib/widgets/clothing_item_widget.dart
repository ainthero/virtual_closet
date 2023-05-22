import 'dart:io';
import 'package:flutter/material.dart';
import '../models/clothing_item.dart';

class ClothingItemWidget extends StatelessWidget {
  final ClothingItem clothingItem;

  ClothingItemWidget({required this.clothingItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: clothingItem.image != null
          ? Image.file(
        File(clothingItem.image!), // Convert the path to a File object
        width: 50,
        height: 50,
      )
          : Container(
        width: 50,
        height: 50,
        color: Colors.grey, // Placeholder color when image is null
      ),
      title: Text(clothingItem.size ?? ''),
      subtitle: Text(clothingItem.label ?? ''),
    );
  }
}
