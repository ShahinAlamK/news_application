import 'package:bigdeal/components/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/news_controller.dart';
import '../../models/news_models.dart';
import '../../widgets/card_widget.dart';

class CategoryNewsScreen extends StatefulWidget {
  const CategoryNewsScreen({Key? key, required this.categories}) : super(key: key);
  final String categories;

  @override
  State<CategoryNewsScreen> createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {

  @override
  void initState() {
    Provider.of<NewsController>(context,listen: false)
        .fetchCategoryController(widget.categories.toLowerCase());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        titleSpacing: 0,
        centerTitle: false,
        backgroundColor: kPrimary,
        title:Text(widget.categories),
      ),

      body:Consumer<NewsController>(builder:(_,category,child){
        if (category.error != null){
          return Center(child: Text(category.error!.toString(),
            style: const TextStyle(fontSize: 20),
          ));
        }
        if (category.categoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: category.categoryNewsList.length,
            itemBuilder: (_, index) {
              Article article = category.categoryNewsList[index];
              return NewsCard(
                title: article.title,
                description: article.description,
                thumbnailUrl: article.urlToImage,
                publishedAt: article.publishedAt,
                source: article.source.name,
              );
            });
      }),
    );
  }
}
