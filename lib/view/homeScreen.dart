import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 10),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            // poster
            Poster(size: size, textTheme: textTheme),
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
            BlogList(
                size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(
              height: 15,
            ),
            //hot Podcast Text
            HottestPodcastRow(bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: size.height/16),
              child: PodcastList(
                  size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            )
          ],
        ),
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
            style: textTheme.bodyLarge!
                .copyWith(color: SolidColors.titleColor),
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
            style: textTheme.bodyLarge!
                .copyWith(color: SolidColors.titleColor),
          )
        ],
      ),
    );
  }
}

class PodcastList extends StatelessWidget {
  const PodcastList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.3,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: blogList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? bodyMargin : 0,
                  left: index == blogList.length - 1 ? bodyMargin : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        height: size.height / 5.08,
                        width: size.width / 2.66,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: Image.network(blogList[index].imageUrl)
                                    .image,
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                        foregroundDecoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: GradientColors.onBlogItemGradient,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      Positioned(
                        left: 8,
                        right: 0,
                        bottom: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(blogList[index].writer,
                                style: textTheme.titleMedium!
                                    .copyWith(color: Colors.white)),
                            Row(
                              children: [
                                Text(blogList[index].views,
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
                      blogList[index].title,
                      style: textTheme.bodyLarge!.copyWith(fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class BlogList extends StatelessWidget {
  const BlogList({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.3,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: blogList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? bodyMargin : 0,
                  left: index == blogList.length - 1 ? bodyMargin : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        height: size.height / 5.08,
                        width: size.width / 2.66,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: Image.network(blogList[index].imageUrl)
                                    .image,
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                        foregroundDecoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: GradientColors.onBlogItemGradient,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      Positioned(
                        left: 8,
                        right: 0,
                        bottom: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(blogList[index].writer,
                                style: textTheme.titleMedium!
                                    .copyWith(color: Colors.white)),
                            Row(
                              children: [
                                Text(blogList[index].views,
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
                      blogList[index].title,
                      style: textTheme.bodyLarge!.copyWith(fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            );
          }),
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

class Poster extends StatelessWidget {
  const Poster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            gradient: const LinearGradient(
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
                  homePagePosterMap['title'],
                  style: textTheme.displayLarge,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}