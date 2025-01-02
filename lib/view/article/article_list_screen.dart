import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/component/my_component.dart';
import 'package:tec/controller/article/list_article_controller.dart';
import 'package:tec/controller/article/single_article_controller.dart';
import 'package:tec/main.dart';
import 'package:tec/view/article/single.dart';

class ArticleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    ListArticleController listArticleController = Get.put(ListArticleController());
    var singleArticleController = Get.find<SingleArticleController>();
    return SafeArea(
        child: Obx(
            () => Scaffold(
                    appBar:  CustomizeAppbar(textTheme,
                    singleArticleController.id.value == '0' ?  'لیست مقاله ها':
                    listArticleController.tagName.value
                    ),
                    body:  listArticleController.loading.value == false
                  ? Padding(
                      padding: const EdgeInsets.only(top: 25 , bottom: 20),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: listArticleController.articleList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              var id = listArticleController.articleList[index].id!;
                              singleArticleController.getArticleInfo(id);
                              Get.toNamed(NamedRoute.routeSingleArticleScreen);
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
                                      imageUrl: listArticleController.articleList[index].image!,
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
                                          listArticleController.articleList[index].title!,
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
                                              listArticleController
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
                                                    listArticleController
                                                        .articleList[index].view!,
                                                    style: textTheme.headlineMedium!
                                                        .copyWith(
                                                            color: const Color(
                                                                0xff616161)))),
                                            Text(
                                              listArticleController
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
                  : const loading(),
                    ),
        ),


        );
  }
}
