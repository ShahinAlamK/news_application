import 'package:bigdeal/components/style/app_size.dart';
import 'package:flutter/material.dart';

import '../components/style/app_colors.dart';
import '../components/style/app_fonts.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.name,
    required this.logo,
    required this.onTap,
  });
  final String name, logo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    return GestureDetector(
      onTap:onTap,
      child: Container(
        margin:const EdgeInsets.only(right:5),
        height:55,
        width: 115,
        decoration:BoxDecoration(
          color: kSecondary,
          borderRadius:BorderRadius.circular(5),
          image:DecorationImage(
            fit:BoxFit.cover,
              image:NetworkImage(logo))
        ),
        child: Container(
          decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(5),
            gradient:LinearGradient(
              begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors:[
              Colors.blueGrey.withOpacity(.2),
              Colors.black.withOpacity(.8),
            ])
          ),
          child:Center(child: Text(name,
          style:mediumFonts.copyWith(
            color:kSecondary
          ),)),
        ),
      ),
    );
  }
}
