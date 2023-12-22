import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../model/model_newspaper.dart';

class Api_service{
final all_news_url = "https://newsapi.org/v2/everything?q=apple&from=2023-12-21&to=2023-12-21&sortBy=popularity&apiKey=a4e746ea9ce8437cb4f48baa4a7aad5b";

Future <List<NewsModel>> getAllNews() async{
  try{
    Response response = await get(Uri.parse(all_news_url));
    if( response.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body =json['articles'];
      List<NewsModel> articlesList = body.map((item) => NewsModel.fromJson(item)).toList();
      return articlesList;
    }else{
      throw ('No News Found');
    }

  }catch(e){
    throw e;
  }
}
}
