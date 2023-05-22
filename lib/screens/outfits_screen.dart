import 'package:flutter/material.dart';
import '../models/outfit.dart';
import '../widgets/outfit_item_widget.dart';
import 'add_outfit_screen.dart';

class OutfitsScreen extends StatefulWidget {
  @override
  _OutfitsScreenState createState() => _OutfitsScreenState();
}

class _OutfitsScreenState extends State<OutfitsScreen> {
  List<Outfit> outfits = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outfits'),
      ),
      body: ListView.builder(
        itemCount: outfits.length,
        itemBuilder: (ctx, index) => OutfitItemWidget(outfit: outfits[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-outfit').then((newOutfit) {
            if (newOutfit != null) {
              setState(() {
                outfits.add(newOutfit as Outfit);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
