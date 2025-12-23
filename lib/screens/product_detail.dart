import 'package:flutter/material.dart';
import '../models/cart.dart';

class ProductDetail extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name'])),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          return Scaffold(
            appBar: AppBar(title: Text(product['name'])),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.network(
                    product['image'],
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => const Icon(Icons.image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product['name'], style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20)),
                      const SizedBox(height: 8),
                      Text('\$${product['price']}', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18)),
                      const SizedBox(height: 12),
                      Text(product['description'] ?? ''),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Cart.instance.addItem(CartItem(
                            id: product['id'],
                            name: product['name'],
                            price: (product['price'] as num).toDouble(),
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added ${product['name']} to cart')));
                        },
                        child: const Text('Add to cart'),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
                    );
                  },
                  child: const Text('Add to cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
