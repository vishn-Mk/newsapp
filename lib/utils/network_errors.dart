import 'dart:convert';

networkerror(dynamic res){
  switch(
  res.statusCode
  ){
    case 401:
      throw Exception(jsonDecode(res.body)['errors']);


      default:
       throw Exception('something went wrong');
  }

}