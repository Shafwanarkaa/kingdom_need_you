
import 'package:flutter/foundation.dart';

// Represents a single item in the shopping cart.
class CartItem {
  final String id; // A unique ID for the cart item (product_id + size)
  final String productId;
  final String name;
  final double price;
  final String imageUrl;
  final int quantity;
  final String? size;

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    this.size,
  });

  // Creates a copy of the CartItem with some updated fields.
  CartItem copyWith({
    int? quantity,
  }) {
    return CartItem(
      id: id,
      productId: productId,
      name: name,
      price: price,
      imageUrl: imageUrl,
      quantity: quantity ?? this.quantity,
      size: size,
    );
  }
}

// Manages the state of the shopping cart.
class CartService with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  // Returns a copy of the cart items.
  Map<String, CartItem> get items => {..._items};

  // Returns the total number of items in the cart (sum of quantities).
  int get itemCount => _items.values.fold(0, (sum, item) => sum + item.quantity);

  // Returns the total price of all items in the cart.
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  // Adds an item to the cart or increases its quantity.
  void addItem(Map<String, dynamic> product, String? selectedSize) {
    final productId = product['id'] as String;
    final name = product['name'] as String;
    final price = product['price'] as double;
    final imageUrl = product['image'] as String? ?? '';

    // Create a unique ID for the cart item based on the product and size.
    final cartItemId = selectedSize != null ? '$productId-$selectedSize' : productId;

    if (_items.containsKey(cartItemId)) {
      // If the item is already in the cart, just increase the quantity.
      _items.update(
        cartItemId,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      // Otherwise, add a new item to the cart.
      _items.putIfAbsent(
        cartItemId,
        () => CartItem(
          id: cartItemId,
          productId: productId,
          name: name,
          price: price,
          imageUrl: imageUrl,
          quantity: 1,
          size: selectedSize,
        ),
      );
    }
    // Notify listeners that the cart has changed.
    notifyListeners();
  }

  // Removes a single quantity of an item from the cart.
  void removeSingleItem(String cartItemId) {
    if (!_items.containsKey(cartItemId)) return;

    if (_items[cartItemId]!.quantity > 1) {
      // If quantity is more than 1, just decrease it.
      _items.update(
        cartItemId,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity - 1,
        ),
      );
    } else {
      // If quantity is 1, remove the item completely.
      _items.remove(cartItemId);
    }
    notifyListeners();
  }

  // Removes an entire item from the cart, regardless of quantity.
  void removeItem(String cartItemId) {
    _items.remove(cartItemId);
    notifyListeners();
  }

  // Clears all items from the cart.
  void clear() {
    _items.clear();
    notifyListeners();
  }
}
