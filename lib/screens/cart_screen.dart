
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a Consumer to listen for changes and rebuild the UI accordingly.
    return Consumer<CartService>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Your Cart'),
          ),
          body: cart.items.isEmpty
              // --- If Cart is Empty ---
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.remove_shopping_cart, size: 80, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'Your cart is empty.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              // --- If Cart has Items ---
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cart.items.length,
                        itemBuilder: (ctx, i) {
                          final cartItem = cart.items.values.toList()[i];
                          return _buildCartItemTile(context, cart, cartItem);
                        },
                      ),
                    ),
                    _buildTotalSection(context, cart),
                  ],
                ),
        );
      },
    );
  }

  // Builds a single row for a cart item.
  Widget _buildCartItemTile(BuildContext context, CartService cart, CartItem cartItem) {
    final imageUrl = cartItem.imageUrl;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: SizedBox(
            width: 60,
            child: imageUrl.isNotEmpty
                ? Image.network(imageUrl, fit: BoxFit.contain, errorBuilder: (c, e, s) => const Icon(Icons.hide_image, color: Colors.grey))
                : const Icon(Icons.hide_image, color: Colors.grey),
          ),
          title: Text(cartItem.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price: £${cartItem.price.toStringAsFixed(2)}'),
              if (cartItem.size != null) Text('Size: ${cartItem.size}'),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                onPressed: () => cart.removeSingleItem(cartItem.id),
              ),
              Text(cartItem.quantity.toString(), style: const TextStyle(fontSize: 16)),
              IconButton(
                icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                onPressed: () => cart.addItem({
                  'id': cartItem.productId,
                  'name': cartItem.name,
                  'price': cartItem.price,
                  'image': cartItem.imageUrl,
                  'sizes': [], // Not needed here
                }, cartItem.size),
              ),
              IconButton(
                  icon: const Icon(Icons.delete_forever, color: Colors.grey),
                  onPressed: () => cart.removeItem(cartItem.id),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Builds the bottom section with the total amount and checkout button.
  Widget _buildTotalSection(BuildContext context, CartService cart) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Total Amount',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Chip(
                  label: Text(
                    '£${cart.totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Placeholder for checkout logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Checkout process not implemented yet.')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.red.shade700,
                  foregroundColor: Colors.white,
                ),
                child: const Text('PROCEED TO CHECKOUT', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
