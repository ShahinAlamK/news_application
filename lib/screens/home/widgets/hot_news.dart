import 'package:bigdeal/components/style/app_size.dart';
import 'package:bigdeal/controllers/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/news_models.dart';
import '../../../widgets/card_widget.dart';

class HotNews extends StatelessWidget {
  const HotNews({
    Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Consumer<NewsController>(builder:(_,hotNews,child){
      if (hotNews.error != null){
        return Center(child: Text(hotNews.error!.toString(),
          style: const TextStyle(fontSize: 20),
        ));
      }
      if (hotNews.hotLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: hotNews.newsList.length,
          itemBuilder: (_, index) {
            Article article = hotNews.newsList[index];
            return NewsCard(
              title: article.title,
              description: article.description,
              thumbnailUrl: article.urlToImage,
              publishedAt: article.publishedAt,
              source: article.source.name,
            );
          });
    });
  }
}
