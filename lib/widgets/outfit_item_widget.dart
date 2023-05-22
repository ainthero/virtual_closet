import 'dart:io';
import 'package:flutter/material.dart';
import '../models/outfit.dart';

class OutfitItemWidget extends StatelessWidget {
  final Outfit outfit;

  OutfitItemWidget({required this.outfit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: outfit.shoes.image != null
          ? Image.file(
        File(outfit.shoes.image!),
        width: 50,
        height: 50,
      )
          : Container(
        width: 50,
        height: 50,
        color: Colors.grey,
      ),
      title: Text(outfit.top.label ?? ''),
      subtitle: Text(outfit.bottom.label ?? ''),
      trailing: Text('${outfit.accessories.length} Accessories'),
    );
  }
}
