import 'package:bigdeal/components/style/app_colors.dart';
import 'package:bigdeal/components/style/app_size.dart';
import 'package:flutter/material.dart';

class SourcesNewsScreen extends StatefulWidget {
  const SourcesNewsScreen({Key? key,}) : super(key: key);

  @override
  State<SourcesNewsScreen> createState() => _SourcesNewsScreenState();
}

class _SourcesNewsScreenState extends State<SourcesNewsScreen> {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
           const SliverAppBar(
             elevation: 0,
            backgroundColor:kPrimary,
            pinned: true,
            titleSpacing: 0,
            excludeHeaderSemantics: true,
            expandedHeight: 150.0,
             flexibleSpace: FlexibleSpaceBar(
               centerTitle: false,
               stretchModes: [StretchMode.blurBackground],
               expandedTitleScale: 1.6,
               title: Text('Hello Bangladesh', textScaleFactor: 1),
               collapseMode: CollapseMode.pin,
             ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                return ListTile(
                  leading: Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      child: const Placeholder()),
                  title: Text('Place ${index + 1}', textScaleFactor: 2),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
