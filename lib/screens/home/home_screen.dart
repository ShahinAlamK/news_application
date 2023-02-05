import 'package:bigdeal/components/style/app_colors.dart';
import 'package:bigdeal/components/style/app_fonts.dart';
import 'package:bigdeal/components/style/app_size.dart';
import 'package:bigdeal/controllers/news_controller.dart';
import 'package:bigdeal/screens/home/viewall_channel.dart';
import 'package:bigdeal/screens/home/widgets/top_news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/categories.dart';
import 'widgets/hot_news.dart';
import 'widgets/top_channel.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future onRefresh() async {
    Provider.of<NewsController>(context, listen: false).everythingNewsController();
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  void initState() {
    final provider = Provider.of<NewsController>(context,listen: false);
    provider.everythingNewsController();
    provider.fetchSourceController();
    provider.fetchHeadlineNewsController();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(

      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0,
        centerTitle: false,
        title: Text("World News".toUpperCase(),
          style: extremFonts.copyWith(
              fontSize: SizeConfig.blocSizeHorizontal! * 4.5),
        ),
      ),

      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: const NewsBody()
      ),
    );
  }
}

class NewsBody extends StatefulWidget {
  const NewsBody({Key? key}) : super(key: key);

  @override
  State<NewsBody> createState() => _NewsBodyState();
}
class _NewsBodyState extends State<NewsBody> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsController>(context,listen: false);
    return
       ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 5),
            const TopHeadLine(),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top Channels",
                    style: extremFonts.copyWith(
                        fontSize: SizeConfig.blocSizeHorizontal! * 4.5),
                  ),

                  GestureDetector(
                    onTap:(){
                      Navigator.push(context,MaterialPageRoute(builder:(_)=>ViewAllChannel(
                          sourceModel:provider.sourceList)));
                    },
                    child: Text("View All",
                      style: mediumFonts.copyWith(
                        color:kPrimary,
                          fontSize: SizeConfig.blocSizeHorizontal! * 3.5),
                    ),
                  ),
                ],
              ),
            ),

            const TopChannel(),
            const SizedBox(height:20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Category",
                style: extremFonts.copyWith( fontSize: SizeConfig.blocSizeHorizontal! * 4.5),
              ),
            ),

            const SizedBox(height: 5,),
            const Category(),

            const SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Hot News",
                style: extremFonts.copyWith(fontSize: SizeConfig.blocSizeHorizontal! * 4.5),
              ),
            ),

            const SizedBox(height: 5,),
            const HotNews(),
          ],
        );
  }
}








