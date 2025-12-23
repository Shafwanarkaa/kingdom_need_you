import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CartItem {
  final String id;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'quantity': quantity,
  };

  factory CartItem.fromJson(Map<String, dynamic> j) => CartItem(
    id: j['id'].toString(),
    name: j['name'].toString(),
    price: (j['price'] as num).toDouble(),
    quantity: (j['quantity'] as num).toInt(),
  );
}

class Cart {
  Cart._privateConstructor();

  static final Cart instance = Cart._privateConstructor();

  final List<CartItem> items = [];

  static const String _prefsKey = 'cart_items_v1';

  void addItem(CartItem item) {
    final existing = items.where((i) => i.id == item.id).toList();
    if (existing.isNotEmpty) {
      existing.first.quantity += item.quantity;
    } else {
      items.add(item);
    }
    // save async, don't await
    _save();
  }

  void clear() {
    items.clear();
    _save();
  }

  double get total => items.fold(0.0, (sum, i) => sum + i.price * i.quantity);

  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final s = prefs.getString(_prefsKey);
      if (s == null || s.isEmpty) return;
      final List<dynamic> arr = json.decode(s) as List<dynamic>;
      items.clear();
      for (var e in arr) {
        items.add(CartItem.fromJson(Map<String, dynamic>.from(e as Map)));
      }
    } catch (e) {
      // ignore load errors for now
      print('Cart load failed: $e');
    }
  }

  Future<void> _save() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final encoded = json.encode(items.map((e) => e.toJson()).toList());
      await prefs.setString(_prefsKey, encoded);
    } catch (e) {
      print('Cart save failed: $e');
    }
  }
}
