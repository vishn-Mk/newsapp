import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/Model/News_Model.dart';
import 'package:newsapp/utils/network_errors.dart';

Future <List<NewsModel>> fetchAlbum() async {

  var data = await http.get(Uri.parse(
      'https://gnews.io/api/v4/top-headlines?category=health&apikey=13cd77d11676c0aa57eac164de3781c4'));
  var decodedData = jsonDecode(data.body) ;
  print(data.statusCode);
  print(data.body);

  if(data.statusCode == 200){
    List<NewsModel> list1= decodedData['articles'].map<NewsModel>((e){
      return NewsModel.fromJson(e);
    }).toList();
    print(list1);

    return list1;
  }else{
    throw networkerror(data);

  }

}