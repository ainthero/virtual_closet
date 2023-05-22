import 'accessory.dart';
import 'clothing_item.dart';

class Outfit {
  final String label;
  final List<ClothingItem> items;


  Outfit({
    required this.label,
    required this.items
  });
}
