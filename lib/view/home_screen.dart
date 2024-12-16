import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/component/my_component.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Obx(() => homeScreenController.loading.value == false ? SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 10),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              // poster
              Poster(),
              const SizedBox(
                height: 40,
              ),
              // scroll tags
              ScrollTags(bodyMargin: bodyMargin, textTheme: textTheme),
              const SizedBox(
                height: 40,
              ),
              // hotest text
              HottestBlogRow(bodyMargin: bodyMargin, textTheme: textTheme),
              const SizedBox(
                height: 10,
              ),
              //BlogList
              BlogList(),
              const SizedBox(
                height: 15,
              ),
              //hot Podcast Text
              HottestPodcastRow(bodyMargin: bodyMargin, textTheme: textTheme),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height / 16),
                child: PodcastList(),
              )
            ],
          ),
        ),
      ) : loading(),
    );
  }

  Widget BlogList() {
    return SizedBox(
      height: size.height / 3.3,
      child: Obx(
        () => ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: homeScreenController.topVisitedList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: homeScreenController.topVisitedList[index].image!,
                          imageBuilder: (context, imageProvider) =>
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            height: size.height / 5.08,
                            width: size.width / 2.66,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover),
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
                                child: Icon(Icons.image_not_supported_outlined , size: 40, color: Colors.grey,),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          left: 8,
                          right: 0,
                          bottom: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  homeScreenController
                                      .topVisitedList[index].author!,
                                  style: textTheme.titleMedium!
                                      .copyWith(color: Colors.white)),
                              Row(
                                children: [
                                  Text(
                                      homeScreenController
                                          .topVisitedList[index].view!,
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
                        homeScreenController.topVisitedList[index].title!,
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

  Widget PodcastList() {
    return SizedBox(
      height: size.height / 3.3,
      child: Obx(
        () => ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: homeScreenController.topPodcastList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: homeScreenController
                              .topPodcastList[index].poster!,
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
                                child: loading()
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
                            )));
                          },
                        ),
                        Positioned(
                          left: 8,
                          right: 0,
                          bottom: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(homeScreenController.topPodcastList[index].author!,
                                  style: textTheme.titleMedium!
                                      .copyWith(color: Colors.white)),
                              Row(
                                children: [
                                  Text(homeScreenController.topPodcastList[index].view!,
                                      style: textTheme.titleMedium),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.white,
                                    size: 18,
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
                        homeScreenController.topPodcastList[index].title!,
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
  
  Widget Poster(){
    return Obx(()
      => Stack(
        children: [
          // image and gradient
          CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) =>
            Container(
              height: size.height / 4.2,
              width: size.width / 1.19,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(22),
              ),
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: const LinearGradient(
                  colors: GradientColors.onPosterGradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            placeholder: (context, url) {
              return Container(
                height: size.height / 4.2,
                width: size.width / 1.19,
                child: const Center(
                  child: loading(),
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Container(
                  height: size.height / 4.2,
                  width: size.width / 1.19,
                  child: const Center(
                    child: Icon(Icons.image_not_supported_outlined , color: Colors.grey , size: 40,),
                  ),

              );
            },
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
                    Text(
                        homePagePosterMap['writer'] +
                            ' - ' +
                            homePagePosterMap['date'],
                        style: textTheme.titleMedium),
                    Row(
                      children: [
                        Text(homePagePosterMap['view'],
                            style: textTheme.titleMedium),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.remove_red_eye_sharp,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 32, 0),
                  child: Text(
                    homeScreenController.poster.value.title!,
                    style: textTheme.displayLarge,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



class HottestPodcastRow extends StatelessWidget {
  const HottestPodcastRow({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.microphone.path),
            color: SolidColors.titleColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestPodcasts,
            style: textTheme.bodyLarge!.copyWith(color: SolidColors.titleColor),
          )
        ],
      ),
    );
  }
}

class HottestBlogRow extends StatelessWidget {
  const HottestBlogRow({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.pencil.path),
            color: SolidColors.titleColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestPosts,
            style: textTheme.bodyLarge!.copyWith(color: SolidColors.titleColor),
          )
        ],
      ),
    );
  }
}

class ScrollTags extends StatelessWidget {
  const ScrollTags({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 18,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: listTags.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.fromLTRB(30, 4, 15, 8),
              margin: EdgeInsets.fromLTRB(
                  index == listTags.length - 1 ? bodyMargin : 15,
                  0,
                  index == 0 ? bodyMargin : 0,
                  0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: GradientColors.tagsGradient,
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    Assets.images.tag.path,
                    height: 16,
                    width: 16,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    listTags[index].title,
                    style: textTheme.titleMedium!
                        .copyWith(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            );
          }),
    );
  }
}


