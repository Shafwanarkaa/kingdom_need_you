import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/news_article.dart';
import '../models/shoutout.dart';
import '../data/dummy_data.dart';

class DataService extends ChangeNotifier {
  final String _baseUrl = dotenv.get('MOCK_API_URL');

  List<NewsArticle> _newsArticles = [];
  List<Map<String, dynamic>> _products = [];
  List<Shoutout> _shoutouts = [];
  bool _isLoading = false;

  DataService() {
    _init();
  }

  bool get isLoading => _isLoading;
  List<NewsArticle> get newsArticles => _newsArticles;
  List<Map<String, dynamic>> get products => _products;
  List<Shoutout> get shoutouts => _shoutouts;

  Future<void> _init() async {
    await fetchAll();
  }

  Future<void> fetchAll() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        final news = <NewsArticle>[];
        final products = <Map<String, dynamic>>[];
        final shoutouts = <Shoutout>[];

        final typeCounts = <String, int>{};

        for (var item in data) {
          final type = item['type']?.toString() ?? 'unknown';
          typeCounts[type] = (typeCounts[type] ?? 0) + 1;

          try {
            if (type == 'news') {
              news.add(NewsArticle.fromJson(item));
            } else if (type == 'product') {
              products.add({
                'id': item['id']?.toString() ?? '',
                'name': item['user_name'] ?? 'Product',
                'price': double.tryParse(item['price'].toString()) ?? 0.0,
                'image': item['imageUrl'],
                'description': item['content'],
                'brand': item['meta'],
              });
            } else if (type == 'shoutout') {
              shoutouts.add(Shoutout.fromJson(item));
            }
          } catch (e) {
            print('Error parsing item (ID: ${item['id']}): $e');
          }
        }

        print('Fetched ${data.length} items. Types found: $typeCounts');

        // Fallback to dummy per type for a better UX when MockAPI is partially empty
        _newsArticles = news.isEmpty ? List.from(DummyData.news) : news;
        _products =
            products.isEmpty ? List.from(DummyData.shopItems) : products;
        _shoutouts = shoutouts;
      }
    } catch (e) {
      print('Error fetching data: $e');
      _newsArticles = List.from(DummyData.news);
      _products = List.from(DummyData.shopItems);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // --- Unified CRUD Methods ---
  Future<void> addItem(Map<String, dynamic> item) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(item),
      );
      if (response.statusCode == 201) {
        await fetchAll();
      }
    } catch (e) {
      print('Error adding item: $e');
    }
  }

  Future<void> updateItem(String id, Map<String, dynamic> item) async {
    try {
      final response = await http.put(
        Uri.parse('$_baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(item),
      );
      if (response.statusCode == 200) {
        await fetchAll();
      }
    } catch (e) {
      print('Error updating item: $e');
    }
  }

  Future<void> deleteItem(String id) async {
    try {
      final response = await http.delete(Uri.parse('$_baseUrl/$id'));
      if (response.statusCode == 200) {
        await fetchAll();
      }
    } catch (e) {
      print('Error deleting item: $e');
    }
  }

  // Bridging methods for existing code
  void addNews(NewsArticle article) {
    addItem({
      'type': 'news',
      'user_name': article.title,
      'content': article.content,
      'imageUrl': article.urlToImage,
      'meta': article.author,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  void updateNews(int index, NewsArticle article) {
    // Note: For now placeholder until NewsArticle has IDs
  }

  void deleteNews(String id) {
    if (id.isNotEmpty) {
      deleteItem(id);
    } else {
      // Handle legacy title-based deletion if necessary, or just skip
    }
  }

  void addProduct(Map<String, dynamic> product) {
    addItem({
      'type': 'product',
      'user_name': product['name'],
      'content': product['description'],
      'imageUrl': product['image'],
      'meta': product['brand'] ?? 'Official MU',
      'price': product['price'],
    });
  }

  void updateProduct(String id, Map<String, dynamic> product) {
    updateItem(id, {
      'type': 'product',
      'user_name': product['name'],
      'content': product['description'],
      'imageUrl': product['image'],
      'meta': product['brand'] ?? 'Official MU',
      'price': product['price'],
    });
  }

  void deleteProduct(String id) {
    deleteItem(id);
  }

  void addShoutout(
    String userName,
    String content,
    String imageUrl,
    String meta,
  ) {
    addItem({
      'type': 'shoutout',
      'user_name': userName,
      'content': content,
      'imageUrl': imageUrl,
      'meta': meta,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }
}
