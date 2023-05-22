import 'package:flutter/material.dart';
import 'package:wardrobe/screens/add_item_screen.dart';
import 'package:wardrobe/screens/add_outfit_screen.dart';
import 'package:wardrobe/screens/clothes_screen.dart';
import 'package:wardrobe/screens/outfits_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Wardrobe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/add-item': (context) => AddItemScreen(),
        '/add-outfit': (context) => CreateOutfitScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ClothesScreen(),
    OutfitsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Clothes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.style),
            label: 'Outfits',
          ),
        ],
      ),
    );
  }
}

