import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bigdeal/components/status.dart';
import 'package:bigdeal/components/utilitis.dart';
import 'package:bigdeal/models/news_models.dart';
import 'package:http/http.dart' as http;

import '../models/source_model.dart';

class NewsService{

  Future<Object> everythingService()async{
    try{
      final response=await http.get(Uri.parse("https://newsapi.org/v2/everything?q=bitcoin&q=bitcoin&apiKey=$apikey"));
      if(response.statusCode==200){
       final decode=jsonDecode(response.body);
       List<Article>articleList=[];
       decode['articles'].forEach((element){
           Article article=Article.fromJson(element);
           articleList.add(article);
       });
      return Success(code: 200,object:articleList);
      }
      return Failure(code: 102,object:"Invalid Host");
    }on HttpException{
      return Failure(code: 502,object:"Bad Request");
    }on SocketException{
      return Failure(code: 502,object:"No Internet");
    }on TimeoutException{
      return Failure(code: 202,object: "Response Timeout");
    }on FormatException{
      return Failure(code: 502,object:"Invalid Format");
    }catch(error){
      return Failure(code: 502,object:error.toString());
    }
  }

  Future<Object> headlineService()async{
    try{
      Uri uri=Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$apikey");
      final response=await http.get(uri).timeout(const Duration(seconds: 30));
      if(response.statusCode==200){
       final decode=jsonDecode(response.body);
  
       List<Article>articleList=[];
       decode['articles'].forEach((element){
           Article article=Article.fromJson(element);
           articleList.add(article);
       });
      return Success(code: 200,object:articleList);
      }
      return Failure(code: 102,object:"Invalid Host");
    }on HttpException{
      return Failure(code: 502,object:"Bad Request");
    }on SocketException{
      return Failure(code: 502,object:"No Internet");
    }on TimeoutException{
      return Failure(code: 202,object: "Response Timeout");
    }on FormatException{
      return Failure(code: 502,object:"Invalid Format");
    }catch(error){
      return Failure(code: 502,object:error.toString());
    }
  }

  Future<Object> categoryService(query)async{
    try{
      Uri uri=Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=$query&apiKey=$apikey");
      final response=await http.get(uri);
      if(response.statusCode==200){
       final decode=jsonDecode(response.body);
       List<Article>articleList=[];
       decode['articles'].forEach((element){
         Article article=Article.fromJson(element);
           articleList.add(article);
       });
      return Success(code: 200,object:articleList);
      }
      return Failure(code: 102,object:"Invalid Host");
    }on HttpException{
      return Failure(code: 502,object:"Bad Request");
    }on SocketException{
      return Failure(code: 502,object:"No Internet");
    }on TimeoutException{
      return Failure(code: 202,object: "Response Timeout");
    }on FormatException{
      return Failure(code: 502,object:"Invalid Format");
    }catch(error){
      return Failure(code: 502,object:error.toString());
    }
  }

  Future<Object> sourceService()async{
    try{
      Uri uri=Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=$apikey");
      final response=await http.get(uri).timeout(const Duration(seconds: 30));
      if(response.statusCode==200){
       final decode=jsonDecode(response.body);
       List<SourceModel>articleList=[];
       decode['sources'].forEach((element){
           SourceModel article=SourceModel.fromJson(element);
           articleList.add(article);
       });
      return Success(code: 200,object:articleList);
      }
      return Failure(code: 102,object:"Invalid Host");
    }on HttpException{
      return Failure(code: 502,object:"Bad Request");
    }on SocketException{
      return Failure(code: 502,object:"No Internet");
    }on TimeoutException{
      return Failure(code: 202,object: "Response Timeout");
    }on FormatException{
      return Failure(code: 502,object:"Invalid Format");
    }catch(error){
      return Failure(code: 502,object:error.toString());
    }
  }

}