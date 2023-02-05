import 'package:bigdeal/components/style/app_fonts.dart';
import 'package:bigdeal/components/style/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svg/error_website_webpage_browser_meltdown_icon.svg",
              width:SizeConfig.width!*1,
            ),
            Text(error,style: mediumFonts.copyWith(
              fontSize: SizeConfig.blocSizeHorizontal!*3.5
            ),)
          ],
        ),
      ),
    );
  }
}
