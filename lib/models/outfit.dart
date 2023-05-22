import 'accessory.dart';
import 'clothing_item.dart';

class Outfit {
  final ClothingItem shoes;
  final ClothingItem top;
  final ClothingItem bottom;
  final List<Accessory> accessories;


  Outfit({
    required this.shoes,
    required this.top,
    required this.bottom,
    required this.accessories,
  });
}
