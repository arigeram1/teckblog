import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tec/models/data_models.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/gen/assets.gen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: SolidColors.scaffoldBgColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 10),
          child: Column(
            children: [
              // app bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.menu),
                  Assets.images.logo.image(height: size.height / 13.64),
                  Assets.images.search.image(width: 26, height: 26)
                ],
              ),
              SizedBox(
                height: 8,
              ),
              // poster
              Stack(
                children: [
                  // image and gradient
                  Container(
                    height: size.height / 4.2,
                    width: size.width / 1.19,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(homePagePosterMap['imageAsset']),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(22),
                    ),
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      gradient: LinearGradient(
                        colors: GradientColors.onPosterGradient,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  // texts
                  Positioned(
                    left: 0,
                    bottom: 20,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(homePagePosterMap['writer'] + ' - ' + homePagePosterMap['date']  , style: textTheme.titleMedium),
                            Row(
                              children: [
                                Text(homePagePosterMap['view']  , style: textTheme.titleMedium),
                                const SizedBox(width: 4,),
                                Icon(Icons.remove_red_eye_sharp , color: Colors.white, size: 18,),
                              ],
                            ),

                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 32, 0),
                          child: Text(homePagePosterMap['title']  , style: textTheme.displayLarge,),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40,),
              // scroll tags
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                //width: double.infinity,
                height: 50,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                itemCount: listTags.length,
                    itemBuilder: (context,index){
                      return Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 15, 0),
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              colors: GradientColors.tagsGradient ,
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                          ),
                        ),
                        child: Row(
                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(Assets.images.tag.path , height: 16, width: 16,),
                            SizedBox(width: 16,),
                            Text(listTags[index].title , style: textTheme.titleMedium!.copyWith(color: Colors.white),)
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
