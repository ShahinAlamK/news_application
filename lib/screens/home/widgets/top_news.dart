import 'package:bigdeal/components/style/app_size.dart';
import 'package:bigdeal/controllers/news_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/style/app_colors.dart';
import '../../../components/style/app_fonts.dart';
import '../../../components/utilitis.dart';


class TopHeadLine extends StatefulWidget {
  const TopHeadLine({super.key,});

  @override
  State<TopHeadLine> createState() => _TopHeadLineState();
}

class _TopHeadLineState extends State<TopHeadLine> {

  @override
  void initState() {
    final provider = Provider.of<NewsController>(context,listen: false);
    provider.fetchHeadlineNewsController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: SizedBox(
        height: 150,
        width: SizeConfig.width,
        child: Consumer<NewsController>(builder:(_,headline,child){
          if (headline.error != null){
            return Center(child: Text(headline.error!.toString(),
              style: const TextStyle(fontSize: 20),
            ));
          }
          if (headline.headingLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return CarouselSlider.builder(
              options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: .9,
                  enlargeCenterPage: false,
                  height: 200
              ),
              itemCount:headline.headlineNewsList.length,
              itemBuilder: (_, index, image) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: SizeConfig.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:CachedNetworkImageProvider(headline.headlineNewsList[index].urlToImage),
                    ),
                  ),
                  child: Container(
                    padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey.withOpacity(.2),
                            Colors.black.withOpacity(0.8),
                          ]),
                    ),
                    alignment: Alignment.bottomRight,
                    child:Column(
                      mainAxisAlignment:MainAxisAlignment.end,
                      children: [
                        Text(
                          headline.headlineNewsList[index].title,
                          textAlign:TextAlign.justify,
                          maxLines: 2,
                          style: largeFonts.copyWith(
                            fontSize: SizeConfig.blocSizeHorizontal! * 3.5,
                            color: kSecondary,
                          ),
                        ),
                        const SizedBox(height:3,),
                        Row(
                          children: [
                            Text(
                              headline.headlineNewsList[index].source.name,
                              maxLines:1,
                              style: smallFonts.copyWith(
                                fontSize: SizeConfig.blocSizeHorizontal! * 2.5,
                                color: kSecondary,
                              ),
                            ),

                            const Spacer(),

                            Text(
                              agoTimeByDate(headline.headlineNewsList[index].publishedAt),
                              maxLines:1,
                              style: smallFonts.copyWith(
                                fontSize: SizeConfig.blocSizeHorizontal! * 2.5,
                                color: kSecondary,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}
