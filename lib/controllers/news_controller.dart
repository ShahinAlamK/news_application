import 'package:bigdeal/components/status.dart';
import 'package:bigdeal/models/news_models.dart';
import 'package:bigdeal/services/news_services.dart';
import 'package:flutter/cupertino.dart';
import '../models/source_model.dart';

class NewsController extends ChangeNotifier{


  List<Article>_newsList=[];
  List<Article>_headlineNewsList=[];
  List<Article>_categoryNewsList=[];
  List<SourceModel>_sourceList=[];

   bool _headingLoading=true;
   bool _channelLoading=true;
   bool _hotLoading=true;
   bool _categoryLoading=true;
   String?_error;

  List<SourceModel>get sourceList=>_sourceList;
  List<Article>get newsList=>_newsList;
  List<Article>get headlineNewsList=>_headlineNewsList;
  List<Article>get categoryNewsList=>_categoryNewsList;
  bool get headingLoading=>_headingLoading;
  bool get channelLoading=>_channelLoading;
  bool get hotLoading=>_hotLoading;
  bool get categoryLoading=>_categoryLoading;
  String? get error=>_error;

  hotNewsDataModel(List<Article> newsModel)async{
    _newsList=newsModel;
    _hotLoading=false;
    notifyListeners();
  }
  categoryNewsDataModel(List<Article> newsModel)async{
      _categoryNewsList=newsModel;
      _categoryLoading=false;
    notifyListeners();
  }
  toHeadlineNewsDataModel(List<Article> newsModel)async{
    _headlineNewsList=newsModel;
    _headingLoading=false;
    notifyListeners();
  }
  sourceDataModel(List<SourceModel> newsModel)async{
    _sourceList=newsModel;
    _channelLoading=false;
    notifyListeners();
  }

  Future<void> everythingNewsController()async{
    final response=await NewsService().everythingService();
    if(response is Success){
      hotNewsDataModel(response.object as List<Article>);
      notifyListeners();
    }if(response is Failure){
      _error=response.object.toString();
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> fetchHeadlineNewsController()async{
    final response=await NewsService().headlineService();
    if(response is Success){
      toHeadlineNewsDataModel(response.object as List<Article>);
      notifyListeners();
    }if(response is Failure){
      _error=response.object.toString();
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> fetchSourceController()async{
    final response=await NewsService().sourceService();
    if(response is Success){
      sourceDataModel(response.object as List<SourceModel>);
      notifyListeners();
    }if(response is Failure){
      _error=response.object.toString();
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> fetchCategoryController(String category)async{
    final response=await NewsService().categoryService(category);
    if(response is Success){
      categoryNewsDataModel(response.object as List<Article>);
      notifyListeners();
    }if(response is Failure){
      //_error=response.object.toString();
      notifyListeners();
    }
    notifyListeners();
  }
}