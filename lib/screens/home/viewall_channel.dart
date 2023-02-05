import 'package:bigdeal/components/style/app_colors.dart';
import 'package:flutter/material.dart';
import '../../components/style/app_fonts.dart';
import '../../components/style/app_size.dart';
import '../../models/source_model.dart';
import 'sources_news.dart';


class ViewAllChannel extends StatelessWidget {
  const ViewAllChannel({Key? key, required this.sourceModel}) : super(key: key);
  final List<SourceModel> sourceModel;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: kPrimary,
        title: const Text("Top Channel"),
      ),

      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
            physics:const BouncingScrollPhysics(),
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio:1.0
            ),
            itemCount: sourceModel.length,
            itemBuilder:(_,index){
              SourceModel sourceData=sourceModel[index];
              return GestureDetector(
                onTap:(){
                  Navigator.push(context,MaterialPageRoute(builder:(_)=>const SourcesNewsScreen()));
                },
                child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height:10),
                        CircleAvatar(backgroundImage:AssetImage("assets/logos/${sourceData.id}.png"),),
                        const SizedBox(height:5),
                        Text(sourceData.name,
                          textAlign:TextAlign.center,
                          maxLines:2,
                          style:largeFonts.copyWith(
                              fontSize: SizeConfig.blocSizeHorizontal!*3
                          ),),
                      ],
                    )),
              );
            },
        ),
      ));
  }
}
