import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';
import 'news_screen.dart';
import 'calendar_screen.dart';
import 'shop_screen.dart';
import 'cart_screen.dart';
import 'admin_screen.dart';
import 'fans_room_screen.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Use NewsScreen as the default home screen (index 0)
  static const List<Widget> _widgetOptions = <Widget>[
    NewsScreen(showCarousel: true), // Index 0: Home (with carousel)
    CalendarScreen(), // Index 1: Calendar
    NewsScreen(showCarousel: false), // Index 2: News (no carousel)
    ShopScreen(), // Index 3: Shop
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Navigate to NewsScreen if the initial screen is the empty one
    // This is a safeguard, the main fix is in _widgetOptions
    if (_selectedIndex == 0 && _widgetOptions[0] is SizedBox) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _selectedIndex = 2; // Navigate to the actual News tab
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle(_selectedIndex)),
        actions: [if (_selectedIndex == 3) _buildCartIcon(context)],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFFDA291C)),
              accountName: Row(
                children: [
                  Text(
                    context.read<AuthService>().username,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (context.read<AuthService>().isAdmin) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDB913),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'PRO',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              accountEmail: Text(context.read<AuthService>().email),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Color(0xFFDA291C), size: 40),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.forum_outlined,
                color: Color(0xFFDA291C),
              ),
              title: const Text('Fans Room'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FansRoomScreen(),
                  ),
                );
              },
            ),
            if (context.watch<AuthService>().isAdmin)
              ListTile(
                leading: const Icon(
                  Icons.admin_panel_settings,
                  color: Color(0xFFDA291C),
                ),
                title: const Text('Admin Dashboard'),
                onTap: () {
                  Navigator.pop(context); // Close drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminScreen(),
                    ),
                  );
                },
              ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.grey),
              title: const Text('Logout'),
              onTap: () {
                context.read<AuthService>().logout();
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
            const Divider(),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Version 1.0.0',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'News'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shop',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Home'; // Title for the new Home screen
      case 1:
        return 'Calendar';
      case 2:
        return 'Latest News';
      case 3:
        return 'Official Merchandise';
      default:
        return 'Kingdom Need You';
    }
  }

  Widget _buildCartIcon(BuildContext context) {
    return Consumer<CartService>(
      builder: (context, cart, child) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: Badge(
              isLabelVisible: cart.itemCount > 0,
              label: Text(cart.itemCount.toString()),
              child: const Icon(Icons.shopping_cart),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        );
      },
    );
  }
}
