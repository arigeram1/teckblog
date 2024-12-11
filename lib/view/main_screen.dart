import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/view/home_screen.dart';
import 'package:tec/view/profile_screen.dart';
import 'package:tec/view/register_intro.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}



class _MainScreenState extends State<MainScreen> {
  var selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 13;
    return SafeArea(
      child: Scaffold(
        backgroundColor: SolidColors.scaffoldBgColor,
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBgColor,
          child: Padding(
            padding:  EdgeInsets.only(left: bodyMargin , right: bodyMargin),
            child: ListView(
              children: [
                const SizedBox(height: 40,),
                Image.asset(Assets.images.logo.path , height: 75,),
                const SizedBox(height: 40,),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('پروفایل کاربری'),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                    onTap: () {},
                    title: const Text('درباره تک بلاگ')),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                    onTap: () {},
                    title: const Text('اشتراک گذاری تک بلاگ')),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                    onTap: () {},
                    title: const Text('تک‌بلاگ در گیت هاب'),),

              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: MyAppBar(size: size),
        ),
        body: Stack(
          children: [
            IndexedStack(
              index: selectedScreenIndex,
              children: [
                HomeScreen(
                    size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                ProfileScreen(
                    size: size, textTheme: textTheme, bodyMargin: bodyMargin)
              ],
            ),
            //bottomNavigation Segment
            BottomNav(
              size: size,
              changeScreen: (int value) {
                setState(() {
                  selectedScreenIndex = value;
                });
              },
            )
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
    required this.changeScreen,
  });

  final Size size;
  final Function(int) changeScreen;

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
            height: size.height / 5.89,
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
          left: size.width / 7,
          right: size.width / 7,
          bottom: 10,
          child: Container(
            height: size.height / 12.35,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: GradientColors.bottomNavGradient),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                        onTap: () => changeScreen(0),
                        child: ImageIcon(
                          AssetImage(Assets.icons.home.path),
                          color: SolidColors.navigationBottomIconsColor,
                        ))),
                Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => RegisterIntro(),));
                      },
                        child: ImageIcon(
                  AssetImage(Assets.icons.feather.path),
                  color: SolidColors.navigationBottomIconsColor,
                ))),
                Expanded(
                    child: InkWell(
                        onTap: () => changeScreen(1),
                        child: ImageIcon(
                          AssetImage(Assets.icons.user.path),
                          color: SolidColors.navigationBottomIconsColor,
                        ))),
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
        InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(Icons.menu)
        ),
        Assets.images.logo.image(height: size.height / 13.64),
        Assets.images.search.image(width: 26, height: 26)
      ],
    );
  }
}
