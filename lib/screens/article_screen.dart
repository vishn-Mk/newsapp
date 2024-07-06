import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/Model/News_Model.dart';
import 'package:newsapp/controller/article.dart';
import 'package:newsapp/screens/newsdeatlsarticle.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomScrollViewExample(),
    );
  }
}

class CustomScrollViewExample extends StatefulWidget {
  @override
  _CustomScrollViewExampleState createState() => _CustomScrollViewExampleState();
}

class _CustomScrollViewExampleState extends State<CustomScrollViewExample> {
  Future<List<NewsModel>>? _articles;

  @override
  void initState() {
    super.initState();
    _articles = fetchArticle();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Articles',
            style:GoogleFonts.aBeeZee(),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: FutureBuilder<List<NewsModel>>(
          future: _articles,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error.toString()}'));
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 200.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            'assets/img/global-business.jpg',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 16.0,
                            left: 16.0,
                            right: 16.0,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                'Health: How meaningful is predictive eldercare?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                          child: ArticleCard(
                            article: snapshot.data![index],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsDetailScreen(article: snapshot.data![index]),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      childCount: snapshot.data!.length,
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: Text('No articles available'));
            }
          },
        ),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final NewsModel article;
  final VoidCallback onTap;

  const ArticleCard({required this.article, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.person), // Example avatar
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.author.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            article.publishedAt.toString(),
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                article.title.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                article.description.toString(),
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
