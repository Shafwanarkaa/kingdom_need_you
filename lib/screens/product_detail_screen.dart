import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';
import 'package:intl/intl.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.product['image'] as String? ?? '';
    final name = widget.product['name'] as String? ?? 'No Name';
    final price = widget.product['price'] as double? ?? 0.0;
    final sizes = widget.product['sizes'] as List<dynamic>? ?? [];

    final cartService = Provider.of<CartService>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // 1. Premium SliverAppBar with Hero Image
              SliverAppBar(
                expandedHeight: 400.0,
                pinned: true,
                elevation: 0,
                backgroundColor: const Color(0xFFDA291C),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  Consumer<CartService>(
                    builder: (context, cart, child) {
                      return Badge(
                        label: Text(cart.itemCount.toString()),
                        isLabelVisible: cart.itemCount > 0,
                        backgroundColor: const Color(0xFFFDB913),
                        textColor: Colors.black,
                        child: IconButton(
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartScreen(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Product Image Content
                      Container(
                        color: Colors.white,
                        child:
                            imageUrl.isNotEmpty
                                ? (imageUrl.startsWith('http')
                                    ? Image.network(
                                      imageUrl,
                                      fit: BoxFit.contain,
                                    )
                                    : Image.asset(
                                      imageUrl,
                                      fit: BoxFit.contain,
                                    ))
                                : const Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                      ),
                      // Top Gradient for better icon visibility
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.transparent,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      // Bottom subtle gradient for image separation
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.05),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 2. Product Details
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Badge (Optional/Static for now)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDA291C).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'OFFICIAL MERCHANDISE',
                          style: TextStyle(
                            color: Color(0xFFDA291C),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Title
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Price
                      Text(
                        NumberFormat.currency(
                          locale: 'id_ID',
                          symbol: 'Rp ',
                          decimalDigits: 0,
                        ).format(price),
                        style: const TextStyle(
                          color: Color(0xFFDA291C),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 32),
                      const Divider(height: 1),
                      const SizedBox(height: 24),

                      // 3. Size Selector
                      if (sizes.isNotEmpty) ...[
                        _buildSizeSelector(context, sizes.cast<String>()),
                        const SizedBox(height: 24),
                        const Divider(height: 1),
                        const SizedBox(height: 24),
                      ],

                      // 4. Description
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.product['description'] as String? ??
                            'No description available.',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 100), // Spacing for bottom button
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 5. Fixed Bottom Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 15,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (sizes.isNotEmpty && _selectedSize == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select a size.'),
                        backgroundColor: Colors.orange,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    return;
                  }
                  cartService.addItem(widget.product, _selectedSize);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added to cart!'),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: const Color(0xFFDA291C),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'VIEW CART',
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDA291C),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_bag_outlined, size: 22),
                    SizedBox(width: 12),
                    Text(
                      'ADD TO CART',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeSelector(BuildContext context, List<String> sizes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          'Select Size',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children:
              sizes.map((size) {
                final isSelected = _selectedSize == size;
                return ChoiceChip(
                  label: Text(size),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      _selectedSize = selected ? size : null;
                    });
                  },
                  selectedColor: Colors.red.shade700,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  backgroundColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color:
                          isSelected ? Colors.red.shade700 : Colors.grey[400]!,
                    ),
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 16),
        const Divider(),
      ],
    );
  }
}
