import 'dart:ui';

class SolidColors {
  static const Color posterTitleColor = Color(0xffffffff);
  static const Color posterSubTitleColor = Color.fromARGB(200, 255, 255, 255);
  static const Color primaryColor = Color(0xff440457);
  static const Color titleColor = Color(0xff286BB8);
  static const Color textTitleColor = Color(0xff000000);
  static const Color scaffoldBgColor = Color(0xffffffff);
  static const Color statusBarColor = Color(0xffffffff);
  static const Color navigationBarColor = Color(0xffffffff);
  static const Color navigationBottomIconsColor = Color(0xffffffff);
  static const Color lightTextColor = Color(0xffffffff);
  static const Color dividerColor = Color(0xff707070);
  static const Color playedPodcastColor = Color(0xffFF8B1A);
  static const Color userNameColor = Color(0xff420457);
  static const Color subTextColor = Color.fromARGB(255, 197, 197, 197);

}

class GradientColors {
  static const List<Color> bottomNavGradient = [
    Color(0xff19005E),
    Color(0xff440457)
  ];

  static const List<Color> tagsGradient = [
    Color(0xff000000),
    Color(0xff3F3F3F)
  ];

  static const List<Color> headerPostsGradient = [
    Color(0xff2E0347),
    Color(0xff808080)
  ];

  static const List<Color> onPosterGradient = [
    Color.fromRGBO(40, 41, 46, 0),
    Color.fromRGBO(72, 20, 88, 0.5),
    Color.fromRGBO(28, 20, 81, 1),
  ];

  static const List<Color> onBlogItemGradient = [
    Color.fromRGBO(255, 255, 255, 0),
    Color.fromRGBO(0, 0, 0, 0.6),
  ];

  static const List<Color> behindNavBottomGradient = [
    Color.fromRGBO(255, 255, 255, 0),
    Color.fromRGBO(255, 255, 255, 0.4),
    Color.fromRGBO(255, 255, 255, 0.9),
  ];


}
