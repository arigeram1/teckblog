import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/data_models.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/component/my_strings.dart';

class MyCategories extends StatefulWidget {
  @override
  State<MyCategories> createState() => _MyCategoriesState();
}

class _MyCategoriesState extends State<MyCategories> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                SvgPicture.asset(
                  Assets.images.robot.path,
                  height: size.height / 6.18,
                  width: size.width / 5.56,
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: MyStrings.congratulationsText,
                        style: textTheme.bodyMedium!
                            .copyWith(color: SolidColors.primaryColor))),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'نام و نام خانوادگی',
                    hintStyle: textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  MyStrings.faveCategoriesText,
                  style: textTheme.bodyMedium!
                      .copyWith(color: SolidColors.primaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                //tagList
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5.3,
                  child: GridView.builder(
                      itemCount: listTags.length,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.45),
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {

                              setState(() {

                                if(!selectedCategories.contains(listTags[index])){
                                  selectedCategories.add(listTags[index]);
                                }
                                else{
                                  print('');
                                }

                              });


                              // if (!selectedCategories.any((hashTag) => hashTag.title == listTags[index].title)) {
                              //   setState(() {
                              //     selectedCategories.add(HashTag(title: listTags[index].title));
                              //   });
                              // }


                          },
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 5, 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: GradientColors.tagsGradient,
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Assets.images.tag.path,
                                  height: 16,
                                  width: 16,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(listTags[index].title,
                                    style: textTheme.titleMedium!.copyWith(
                                        color: Colors.white, fontSize: 16))
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                //arrow picture
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Image.asset(
                    Assets.images.arrow.path,
                    height: size.height / 16.78,
                    width: size.width / 8.78,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //selected tag list
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5.5,
                  child: GridView.builder(
                      itemCount: selectedCategories.length,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.43),
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              selectedCategories.removeAt(index);
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 5, 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: SolidColors.surfaceColor),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Center(
                                child: Text(selectedCategories[index].title,
                                    style: textTheme.titleMedium!.copyWith(
                                        color: Colors.black, fontSize: 16)),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(onPressed: () {}, child: const Text('ادامه')),

                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
