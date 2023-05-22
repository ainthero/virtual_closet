import 'package:flutter/material.dart';
import 'screens/clothes_screen.dart';
import 'screens/outfits_screen.dart';
import 'screens/add_item_screen.dart';
import 'screens/add_outfit_screen.dart';

void main() {
  runApp(VirtualWardrobeApp());
}

class VirtualWardrobeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Wardrobe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ClothesScreen(),
        '/outfits': (context) => OutfitsScreen(),
        '/add-item': (context) => AddItemScreen(),
        '/add-outfit': (context) => AddOutfitScreen(),
      },
    );
  }
}
