import 'package:flutter/cupertino.dart';

class SizeConfig{
  static MediaQueryData ? _queryData;
  static double ? height;
  static double ? width;
  static double ? blocSizeHorizontal;
  static double ? blocSizeVertical;
  init(BuildContext context){
    _queryData=MediaQuery.of(context);
    height=_queryData!.size.height;
    width=_queryData!.size.width;
    blocSizeHorizontal=width!/100;
    blocSizeVertical=height!/100;
  }
}