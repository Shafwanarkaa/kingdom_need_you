import 'package:flutter/material.dart';
import '../models/cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Cart.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: cart.items.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) {
                final cart = Cart.instance;
                return Scaffold(
                  appBar: AppBar(title: const Text('Cart')),
                  body: Column(
                    children: [
                      Expanded(
                        child: cart.items.isEmpty
                            ? Center(child: Text('Your cart is empty', style: Theme.of(context).textTheme.titleMedium))
                            : ListView.separated(
                                itemCount: cart.items.length,
                                separatorBuilder: (_, __) => const Divider(height: 1),
                                itemBuilder: (context, i) {
                                  final it = cart.items[i];
                                  return ListTile(
                                    title: Text(it.name),
                                    subtitle: Text('\$${it.price} x ${it.quantity}'),
                                    trailing: Text('\$${(it.price * it.quantity).toStringAsFixed(2)}'),
                                  );
                                },
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Total: \$${cart.total.toStringAsFixed(2)}', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18)),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: cart.items.isEmpty
                                  ? null
                                  : () {
                                      showDialog<void>(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: const Text('Checkout (demo)'),
                                          content: const Text('This is a demo checkout. Purchase simulated.'),
                                          actions: [
                                            TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Cancel')),
                                            TextButton(onPressed: () {
                                              cart.clear();
                                              Navigator.of(ctx).pop();
                                              setState(() {});
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Purchase completed (demo)')));
                                            }, child: const Text('Confirm')),
                                          ],
                                        ),
                                      );
                                    },
                              child: const Text('Checkout'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
                                                'Purchase completed (demo)',
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Text('Confirm'),
                                      ),
                                    ],
                                  ),
                            );
                          },
                  child: const Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
