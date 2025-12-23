import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import 'product_detail.dart';
import 'cart_screen.dart';
import '../models/cart.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

            child: Card(
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    final products = DummyData.products;

    return Scaffold(
      appBar: AppBar(title: const Text('Shop')),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
          await Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const CartScreen()));
                        Text(p['name'], style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Text('\$${p['price']}', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: products.length,
        itemBuilder: (context, i) {
          final p = products[i];
          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ProductDetail(product: p)),
              );
              setState(() {});
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      p['image'],
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => const Icon(Icons.image),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '\$${p['price']}',
                          style: const TextStyle(color: Colors.green),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Cart.instance.addItem(
                                  CartItem(
                                    id: p['id'],
                                    name: p['name'],
                                    price: (p['price'] as num).toDouble(),
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Added ${p['name']} to cart'),
                                  ),
                                );
                                setState(() {});
                              },
                              child: const Text('Add'),
                            ),
                            const SizedBox(width: 8),
                            OutlinedButton(
                              onPressed: () async {
                                await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => ProductDetail(product: p),
                                  ),
                                );
                                setState(() {});
                              },
                              child: const Text('Details'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
