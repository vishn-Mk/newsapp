import 'package:flutter/material.dart';
import 'package:newsapp/Model/News_Model.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel article; // Receive article data

  const NewsDetailScreen({required this.article, Key? key}) : super(key: key);

  // Utility function to check if a URL is valid
  bool isValidUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    Uri? uri = Uri.tryParse(url);
    return uri != null && uri.isAbsolute;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 190.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  isValidUrl(article.image)
                      ? Image.network(
                    article.image!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 550,
                  )
                      : Placeholder(
                    fallbackHeight: 250,
                    color: Colors.grey,
                  ),
                  Positioned(
                    bottom: 16.0,
                    left: 16.0,
                    right: 16.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.circle, color: Colors.red, size: 10),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              article.title ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(

                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      article.author ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Divider(height: 22, thickness: 1),
                  Text(
                    article.description ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    article.content ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    article.url ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
