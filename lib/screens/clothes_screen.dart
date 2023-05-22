import 'package:flutter/material.dart';
import '../models/clothing_item.dart';
import '../widgets/clothing_item_widget.dart';
import 'add_item_screen.dart';

class ClothesScreen extends StatefulWidget {
  @override
  _ClothesScreenState createState() => _ClothesScreenState();
}

class _ClothesScreenState extends State<ClothesScreen> {
  List<ClothingItem> clothes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothes'),
      ),
      body: ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (ctx, index) => ClothingItemWidget(clothingItem: clothes[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-item').then((newItem) {
            if (newItem != null) {
              setState(() {
                clothes.add(newItem as ClothingItem);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
