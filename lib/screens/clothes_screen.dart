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
  String filter = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothes'),
        actions: [

          PopupMenuButton(
            // add icon, by default "3 dot" icon
            // icon: Icon(Icons.book)
              itemBuilder: (context){
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Top"),
                  ),

                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Bottom"),
                  ),

                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Shoes"),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Text("Accessory"),
                  ),
                  PopupMenuItem<int>(
                    value: 4,
                    child: Text("All"),
                  ),
                ];
              },
              onSelected:(value){
                if(value == 0){
                  filter = "Top";
                }else if(value == 1){
                  filter = "Bottom";
                }else if(value == 2){
                  filter = "Shoes";
                }else if(value == 3){
                  filter = "Accessory";
                }else if(value == 4){
                  filter = "All";
                }
                setState(() {

                });
              }
          ),


        ],
      ),
      body: ListView.builder(
        itemCount: clothes.where((element) => element.type == filter || filter == "All").length,
        itemBuilder: (ctx, index) => ClothingItemWidget(clothingItem: clothes.where((element) => element.type == filter || filter == "All").toList()[index]),
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
