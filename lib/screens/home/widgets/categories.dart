import 'package:bigdeal/screens/category/category_news_screen.dart';
import 'package:flutter/material.dart';

import '../../../components/style/app_size.dart';
import '../../../models/category_model.dart';
import '../../../widgets/category_card.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height:55,
      width:SizeConfig.width,
      child: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children:List.generate(categoriesList.length, (index) =>CategoryCard(
            name: categoriesList[index].name,
            logo: categoriesList[index].logo,
            onTap:(){
              Navigator.push(context,MaterialPageRoute(builder:(_)=>
                  CategoryNewsScreen(categories:categoriesList[index].name)));
            },
          )),
        ),
      ),
    );
  }
}