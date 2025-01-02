import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tec/constant/my_colors.dart';
import 'package:tec/component/my_component.dart';
import 'package:tec/constant/my_strings.dart';

import 'package:tec/controller/article/manage_article_controller.dart';
import 'package:tec/controller/article/single_article_controller.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/main.dart';

class ManageArticle extends StatelessWidget{

  var manageArticleController = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Obx(
          () => Scaffold(
            appBar: CustomizeAppbar(textTheme, 'مدیریت مقاله ها'),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                onPressed: () {

                  Get.toNamed(NamedRoute.routeSingleManageArticleScreen);
                },
                child: const Text('بریم برای نوشتن یه مقاله باحال'),
              ),
            ),
            body:
            manageArticleController.loading.value == false ?
            manageArticleController.articleList.isNotEmpty ?
             Padding(
              padding: const EdgeInsets.only(top: 25 , bottom: 20),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: manageArticleController.articleList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                     //todo route to single manage article

                    //  Get.toNamed(NamedRoute.routeSingleManageArticleScreen);
                    },
                    child: SizedBox(
                      height: size.height / 7,
                      width: double.infinity,
                      child: Row(
                        children: [
                          // article image
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: CachedNetworkImage(
                              imageUrl: manageArticleController.articleList[index].image!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    width: size.width / 4.5,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(30)),
                                  ),
                              placeholder: (context, url) {
                                return const Center(child: loading());
                              },
                              errorWidget: (context, url, error) {
                                return const Center(
                                  child: Icon(Icons.image_not_supported_outlined , color: Colors.grey, size: 20,),
                                );
                              },
                            ),

                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // article title
                              SizedBox(
                                width: size.width / 1.5,
                                child: Text(
                                  manageArticleController.articleList[index].title!,
                                  maxLines: 2,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // author and views and category
                              Container(
                                width: size.width / 1.57,
                                child: Row(
                                  children: [
                                    Text(
                                      manageArticleController
                                          .articleList[index].author!,
                                      style: textTheme.headlineMedium!.copyWith(
                                          color: const Color(0xff616161)),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text('بازدید',
                                        style: textTheme.headlineMedium!
                                            .copyWith(
                                            color:
                                            const Color(0xff616161))),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                            manageArticleController
                                                .articleList[index].view!,
                                            style: textTheme.headlineMedium!
                                                .copyWith(
                                                color: const Color(
                                                    0xff616161)))),
                                    Text(
                                      manageArticleController
                                          .articleList[index].catName!,
                                      style: textTheme.headlineMedium!.copyWith(
                                          color: const Color(0xff2C7DB4)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
                : articleEmptyState(size, textTheme) :
                 const loading()
            ,
          ),
        ));
  }

  Widget articleEmptyState(Size size, TextTheme textTheme) {
    return Container(
          alignment: Alignment.center,
          height: double.infinity,
          // main column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // inside column for image and text
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.images.sadBot.path,
                      height: size.height / 6.18,
                      width: size.width / 5.56,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: MyStrings.emptyArticleText,
                            style: textTheme.bodyMedium!
                                .copyWith(color: SolidColors.RegisterColor))),
                  ],
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(bottom: 35),
              //   child: ElevatedButton(
              //     // show bottom sheet for get email
              //     onPressed: () {
              //
              //     },
              //     child: const Text('بریم برای نوشتن یه مقاله باحال'),
              //   ),
              // ),
            ],
          ),
        );
  }
}