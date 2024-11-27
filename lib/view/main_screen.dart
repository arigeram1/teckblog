import 'package:flutter/material.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/view/profile_screen.dart';
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 13;
    return SafeArea(
      child: Scaffold(
        backgroundColor: SolidColors.scaffoldBgColor,
        appBar: AppBar(
          title: MyAppBar(size: size),
        ),
        body:
        Stack(
          children: [
            Center(child: ProfileScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin)),
            //bottomNavigation Segment
            BottomNav(size: size)

          ],
        ),
      ),
    );
  }
}



class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // behind gradinet segment
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: size.height/5.89,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: GradientColors.behindNavBottomGradient,
              begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        // bottomNav segment
        Positioned(
          left: size.width/7,
          right: size.width/7,
          bottom: 10,
          child: Container(
            height: size.height/12.35,
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors:
                GradientColors.bottomNavGradient
                ),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              children: [
                Expanded(
                    child: ImageIcon(AssetImage(Assets.icons.home.path) , color: SolidColors.navigationBottomIconsColor,)
                ),
                Expanded(
                    child: ImageIcon(AssetImage(Assets.icons.feather.path), color: SolidColors.navigationBottomIconsColor,)
                ),
                Expanded(
                    child: ImageIcon(AssetImage(Assets.icons.user.path), color: SolidColors.navigationBottomIconsColor,)
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}



class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(Icons.menu),
        Assets.images.logo.image(height: size.height / 13.64),
        Assets.images.search.image(width: 26, height: 26)
      ],
    );
  }
}