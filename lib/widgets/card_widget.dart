import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../components/style/app_colors.dart';
import '../components/style/app_fonts.dart';
import '../components/style/app_size.dart';
import '../components/utilitis.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String thumbnailUrl;
  final Object publishedAt;
  final String source;

  const NewsCard({super.key,
    required this.title,
    required this.thumbnailUrl,
    required this.publishedAt,
    required this.source,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal:10, vertical: 5),
      width: MediaQuery.of(context).size.width,
      //height:320,
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              0.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -5.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          SizedBox(
              //height: 170,
              width:SizeConfig.width,
              child: ClipRRect(
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child:Image.network(thumbnailUrl,
                    errorBuilder:(context,error,child){
                    return  Image.asset("assets/img/placeholder.jpg");
                    },
                    loadingBuilder:(BuildContext context, Widget child, ImageChunkEvent? load){
                    if(load==null)return child;
                    return Image.asset("assets/img/placeholder.jpg");
                    },
                  ))),

          Padding(
            padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Text(title,
              textAlign: TextAlign.justify,
              maxLines: 2,
              style:largeFonts.copyWith(
                  fontSize: SizeConfig.blocSizeHorizontal!*4
              ),),
          ),
          const SizedBox(height: 2,),

          Padding(
            padding: const EdgeInsets.only(top:5,left: 10,right: 10),
            child: Text(description,
              textAlign: TextAlign.justify,
              maxLines:3,
              style:smallFonts.copyWith(
                  fontSize: SizeConfig.blocSizeHorizontal!*3
              ),),
          ),
          //const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top:5,left: 10,right: 10,bottom: 6),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Text(source,style:smallFonts.copyWith(
                    fontSize: SizeConfig.blocSizeHorizontal!*3,
                    color:kOnSecondary
                )),

                Text(agoTimeByDate(publishedAt),style:smallFonts.copyWith(
                    fontSize: SizeConfig.blocSizeHorizontal!*3,
                    color:kOnSecondary
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

cachedNetImage({required String image}){
  return CachedNetworkImage(
     imageUrl: image,
    fit: BoxFit.cover,

  );
}