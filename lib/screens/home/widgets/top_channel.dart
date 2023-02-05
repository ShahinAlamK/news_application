import 'package:bigdeal/controllers/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/style/app_fonts.dart';
import '../../../components/style/app_size.dart';
import '../../../models/source_model.dart';
import '../sources_news.dart';


class TopChannel extends StatelessWidget {
  const TopChannel({super.key,});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        width:SizeConfig.width,
        height:70,
        padding: const EdgeInsets.symmetric(horizontal:10),
        child: Consumer<NewsController>(builder:(_,topChannel,child){

          if (topChannel.error != null){
            return Center(child: Text(topChannel.error!.toString(),
              style: const TextStyle(fontSize: 20),
            ));
          }
          if (topChannel.channelLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
              physics:const BouncingScrollPhysics(),
              scrollDirection:Axis.horizontal,
              itemCount: topChannel.sourceList.length.clamp(0,10),
              itemBuilder:(_,index){
                SourceModel sourceData=topChannel.sourceList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder:(_)=>const SourcesNewsScreen()));
                  },
                  child: Container(
                      width:70,
                      margin:const EdgeInsets.only(right:2),
                      padding: const EdgeInsets.all(5),
                      decoration:BoxDecoration(
                        //color:kPrimary,
                          borderRadius:BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        crossAxisAlignment:CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor:Colors.transparent,
                            backgroundImage:AssetImage("assets/logos/${sourceData.id}.png"),
                          ),
                          const SizedBox(height:2),
                          Text(sourceData.name,
                            textAlign:TextAlign.center,
                            maxLines:1,
                            style:mediumFonts.copyWith(
                                fontSize: SizeConfig.blocSizeHorizontal!*2.4
                            ),),
                        ],
                      )),
                );
              });
        })
    );
  }
}