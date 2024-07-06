import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/Model/News_Model.dart';
import 'package:newsapp/utils/network_errors.dart';

Future<List<NewsModel>> fetchArticle() async {
  final apiKey = 'YOUR_API_KEY'; // Replace with your API key
  final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=d10f1442dd6f4d9faa9886f7b79a7b77');

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final articles = jsonBody['articles'] as List<dynamic>;
      return articles.map((articleJson) => NewsModel.fromJson(articleJson)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  } catch (e) {
    throw Exception('Failed to load articles: $e');
  }
}