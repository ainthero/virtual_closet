import 'dart:io';
import 'package:flutter/material.dart';
import '../models/outfit.dart';

class OutfitItemWidget extends StatelessWidget {
  final Outfit outfit;

  OutfitItemWidget({required this.outfit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.94,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        color: Colors.white70,
        elevation: 10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.2,
                  maxHeight: MediaQuery.of(context).size.width * 0.2,
                ),
                child: Image.file(
                    File(outfit.items[0].image!)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.2,
                  maxHeight: MediaQuery.of(context).size.width * 0.2,
                ),
                child: Image.file(
                    File(outfit.items[1].image!)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.2,
                  maxHeight: MediaQuery.of(context).size.width * 0.2,
                ),
                child: Image.file(
                    File(outfit.items[2].image!)
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      outfit.label,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
    /*return ListTile(
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
      trailing: Text('${outfit.accessories.length} Accessories'),*/
  }
}
