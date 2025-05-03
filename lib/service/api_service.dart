import 'dart:convert';

import 'package:flutter_cubit_with_api_demo/constants.dart';
import 'package:flutter_cubit_with_api_demo/model/news_model.dart';
import 'package:http/http.dart' as http;


class ApiService{
    List<NewsModel> newsList = [];
    Future<List<NewsModel>> getNews()async{
      try{
        newsList = [];
        var request = http.Request('GET',Uri.parse(AppConstants.newsApiBD));
        http.StreamedResponse response = await request.send();
        if(response.statusCode == 200){
          var rawData = await response.stream.bytesToString();
          var data = jsonDecode(rawData);
          for(var item in data['results']){
            newsList.add(NewsModel.fromJson(item));
          }
         // newsList = data['results'].map((e)=>NewsModel.fromJson(e)).toList();
        }

        return newsList;

      }catch(e){
        rethrow;
      }
    }
}