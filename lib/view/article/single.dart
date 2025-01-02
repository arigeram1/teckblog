import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tec/constant/my_colors.dart';
import 'package:tec/component/my_component.dart';
import 'package:tec/controller/home_screen_controller.dart';
import 'package:tec/controller/article/list_article_controller.dart';
import 'package:tec/controller/article/single_article_controller.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/view/article/article_list_screen.dart';



class Single extends StatelessWidget {
  var singleArticleController = Get.find<SingleArticleController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Obx(
      () => Scaffold(
          body: singleArticleController.loading.value == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // top level segment
                      Stack(
                        children: [
                          // single image
                          CachedNetworkImage(
                            imageUrl: singleArticleController
                                .singleArticleModel.value.image!,
                            imageBuilder: (context, imageProvider) => Container(
                              height: size.height / 3.5,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                  color: SolidColors.appbarBackColor),
                            ),
                            placeholder: (context, url) {
                              return const loading();
                            },
                            errorWidget: (context, url, error) {
                              return const Center(
                                  child: Icon(
                                Icons.image_not_supported_outlined,
                                color: Colors.grey,
                                size: 20,
                              ));
                            },
                          ),
                          // gradient
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            child: Container(
                              height: size.height / 6,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                colors: GradientColors.headerPostsGradient,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )),
                            ),
                          ),
                          // app bar
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            width: size.width,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Icon(
                                        Icons.arrow_back,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                //   Expanded(child: SizedBox()),
                                const Icon(
                                  CupertinoIcons.bookmark,
                                  size: 26,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Icon(
                                  Icons.share,
                                  size: 28,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // article title
                      Container(
                        padding: const EdgeInsets.only(right: 12),
                        width: size.width / 1.1,
                        child: Text(
                          singleArticleController
                              .singleArticleModel.value.title!,
                          style: textTheme.displayLarge!.copyWith(
                            color: Colors.black,
                            height: 1.3,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // author information
                      Container(
                        padding: const EdgeInsets.only(right: 13),
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.images.profile.path,
                              width: 40,
                              height: 40,
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Text(
                              singleArticleController
                                  .singleArticleModel.value.author!,
                              style: textTheme.displayLarge!
                                  .copyWith(color: Colors.black),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              singleArticleController
                                  .singleArticleModel.value.createdAt!,
                              style: textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 25 , left: 15),
                        child: HtmlWidget(singleArticleController
                            .singleArticleModel.value.content!),
                      ),
                      const SizedBox(
                        height: 60,
                      ),

                      scrollTags(size),

                      const SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: 30, right: size.width / 16),
                        child: Text(
                          'نوشته های مرتبط',
                          style: textTheme.bodyLarge!
                              .copyWith(color: SolidColors.titleColor),
                        ),
                      ),
                      RelatedArticle(size, textTheme)
                    ],
                  ),
                )
              : const Center(child: loading())),
    ));
  }

  Widget scrollTags(Size size) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      width: double.infinity,
      height: size.height / 18,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: singleArticleController.relatedTagsList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async{
              var tagId = singleArticleController.relatedTagsList[index].id!;
              await Get.find<ListArticleController>().getArticleListWithTagId(tagId);
              Get.to(ArticleListScreen());
            },
            child: Container(
              padding: const EdgeInsets.only(right: 35, left: 35),
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: SolidColors.tagsColor),
              child: Center(child: Text(singleArticleController.relatedTagsList[index].title!)),
            ),
          );
        },
      ),
    );
  }

  Widget RelatedArticle(Size size, TextTheme textTheme) {
    return SizedBox(
      height: size.height / 3.3,
      child: Obx(
        () => ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: singleArticleController.relatedArticleList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(right: index == 0 ? size.width / 16 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          onTap: () async{
                            var id = singleArticleController.relatedArticleList[index].id!;
                            await singleArticleController.getArticleInfo(id);
                            Get.forceAppUpdate();
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                            singleArticleController.relatedArticleList[index].image!,
                            imageBuilder: (context, imageProvider) => Container(
                              margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              height: size.height / 5.08,
                              width: size.width / 2.66,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15)),
                              foregroundDecoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: GradientColors.onBlogItemGradient,
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            placeholder: (context, url) {
                              return Container(
                                margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                height: size.height / 5.08,
                                width: size.width / 2.66,
                                child: const Center(
                                  child: loading(),
                                ),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return Container(
                                margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                height: size.height / 5.08,
                                width: size.width / 2.66,
                                child: const Center(
                                  child: Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          left: 8,
                          right: 0,
                          bottom: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  singleArticleController.relatedArticleList[index].author!,
                                  style: textTheme.titleMedium!
                                      .copyWith(color: Colors.white)),
                              Row(
                                children: [
                                  Text(
                                      singleArticleController.relatedArticleList[index].view!,
                                      style: textTheme.titleMedium),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: size.width / 2.66,
                      child: Text(
                        singleArticleController.relatedArticleList[index].title!,
                        style: textTheme.bodyLarge!.copyWith(fontSize: 13),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
