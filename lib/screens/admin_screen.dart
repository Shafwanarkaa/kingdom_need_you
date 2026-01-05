import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/data_service.dart';
import '../models/news_article.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          title: const Text(
            'Admin Central',
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [Tab(text: 'News Feed'), Tab(text: 'Merchandise')],
            indicatorColor: Color.fromARGB(255, 245, 252, 250),
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: const TabBarView(children: [ManageNewsTab(), ManageShopTab()]),
      ),
    );
  }
}

class ManageNewsTab extends StatelessWidget {
  const ManageNewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataService>(
      builder: (context, dataService, child) {
        final news = dataService.newsArticles;
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: news.length,
            separatorBuilder: (c, i) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final article = news[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:
                        article.urlToImage != null &&
                                article.urlToImage!.isNotEmpty
                            ? Image.network(
                              article.urlToImage!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (c, e, s) => Container(
                                    color: Colors.grey[200],
                                    child: const Icon(
                                      Icons.article,
                                      color: Colors.grey,
                                    ),
                                  ),
                            )
                            : Container(
                              color: Colors.grey[200],
                              child: const Icon(
                                Icons.article,
                                color: Colors.grey,
                                size: 30,
                              ),
                            ),
                  ),
                  title: Text(
                    article.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    article.author ?? 'MU Staff',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed:
                            () => _showNewsDialog(
                              context,
                              dataService,
                              article: article,
                              index: index,
                            ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Color(0xFFDA291C),
                        ),
                        onPressed: () => dataService.deleteNews(article.id),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => _showNewsDialog(context, dataService),
            backgroundColor: const Color(0xFFDA291C),
            icon: const Icon(Icons.add_circle, color: Colors.white),
            label: const Text(
              'POST NEWS',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  void _showNewsDialog(
    BuildContext context,
    DataService dataService, {
    NewsArticle? article,
    int? index,
  }) {
    final titleController = TextEditingController(text: article?.title);
    final authorController = TextEditingController(text: article?.author);
    final contentController = TextEditingController(text: article?.content);
    final imageController = TextEditingController(text: article?.urlToImage);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
              bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article == null ? 'Post News' : 'Edit News',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      _buildField('Article Title', titleController),
                      const SizedBox(height: 16),
                      _buildField('Author', authorController),
                      const SizedBox(height: 16),
                      _buildField(
                        'Content/Description',
                        contentController,
                        maxLines: 5,
                      ),
                      const SizedBox(height: 16),
                      _buildField('Image URL', imageController),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            if (titleController.text.isNotEmpty) {
                              final newArticle = NewsArticle(
                                title: titleController.text,
                                author: authorController.text,
                                content: contentController.text,
                                publishedAt:
                                    article?.publishedAt ?? DateTime.now(),
                                url: article?.url ?? '',
                                urlToImage:
                                    imageController.text.isNotEmpty
                                        ? imageController.text
                                        : (article?.urlToImage ??
                                            'https://images.unsplash.com/photo-1522778119026-d647f0596c20?q=80&w=1000'),
                              );
                              if (article == null) {
                                dataService.addNews(newArticle);
                              } else {
                                dataService.updateNews(index!, newArticle);
                              }
                              Navigator.pop(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFDA291C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            article == null ? 'PUBLISH' : 'UPDATE',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class ManageShopTab extends StatelessWidget {
  const ManageShopTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataService>(
      builder: (context, dataService, child) {
        final products = dataService.products;
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            separatorBuilder: (c, i) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final product = products[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product['image'],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (c, e, s) => Container(
                            color: Colors.grey[200],
                            child: const Icon(
                              Icons.shopping_bag,
                              color: Colors.grey,
                            ),
                          ),
                    ),
                  ),
                  title: Text(
                    product['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    'Rp ${product['price']}',
                    style: const TextStyle(
                      color: Color(0xFFDA291C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed:
                            () => _showProductDialog(
                              context,
                              dataService,
                              product: product,
                            ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Color(0xFFDA291C),
                        ),
                        onPressed:
                            () => dataService.deleteProduct(product['id']),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => _showProductDialog(context, dataService),
            backgroundColor: Colors.black,
            icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
            label: const Text(
              'ADD PRODUCT',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  void _showProductDialog(
    BuildContext context,
    DataService dataService, {
    Map<String, dynamic>? product,
  }) {
    final nameController = TextEditingController(text: product?['name']);
    final priceController = TextEditingController(
      text: product?['price'].toString(),
    );
    final descController = TextEditingController(text: product?['description']);
    final imageController = TextEditingController(text: product?['image']);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
              bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product == null ? 'Add Product' : 'Edit Product',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      _buildField('Product Name', nameController),
                      const SizedBox(height: 16),
                      _buildField(
                        'Price (IDR)',
                        priceController,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      _buildField('Description', descController, maxLines: 5),
                      const SizedBox(height: 16),
                      _buildField('Image URL', imageController),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            if (nameController.text.isNotEmpty) {
                              final pData = {
                                'id':
                                    product?['id'] ??
                                    DateTime.now().millisecondsSinceEpoch
                                        .toString(),
                                'name': nameController.text,
                                'price':
                                    double.tryParse(priceController.text) ??
                                    0.0,
                                'image':
                                    imageController.text.isNotEmpty
                                        ? imageController.text
                                        : (product?['image'] ??
                                            'https://images.unsplash.com/photo-1574629810360-7efbbe195018?q=80&w=1000'),
                                'description': descController.text,
                              };
                              if (product == null) {
                                dataService.addProduct(pData);
                              } else {
                                dataService.updateProduct(product['id'], pData);
                              }
                              Navigator.pop(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            product == null ? 'SAVE PRODUCT' : 'UPDATE PRODUCT',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
