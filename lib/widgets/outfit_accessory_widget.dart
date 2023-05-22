import 'package:flutter/material.dart';
import '../models/accessory.dart';

class OutfitAccessoryWidget extends StatelessWidget {
  final Accessory accessory;

  OutfitAccessoryWidget({required this.accessory});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: accessory.image != null
          ? Image.network(
        accessory.image!, // Use the non-nullable String directly
        width: 50,
        height: 50,
      )
          : Container(
        width: 50,
        height: 50,
        color: Colors.grey, // Placeholder color when image is null
      ),
      title: Text(accessory.label ?? ''),
    );
  }
}
