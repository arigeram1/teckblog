import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec/binding.dart';
import 'package:tec/gen/fonts.gen.dart';
import 'package:tec/constant/my_colors.dart';
import 'package:tec/my_http_overrides.dart';
import 'package:tec/view/article/manage_article.dart';
import 'package:tec/view/article/single_article_manage.dart';
import 'package:tec/view/main_screen/main_screen.dart';
import 'package:tec/view/article/single.dart';
import 'package:tec/view/splash_screen.dart';

void main() async{
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.navigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      initialBinding: ArticleBinding(),
      locale: const Locale('fa'),
      debugShowCheckedModeBanner: false,
      title: 'Tech Blog',
      theme: lightTheme(size, textTheme),
      getPages: [
        GetPage(name: NamedRoute.routeMainScreen, page: () => MainScreen(), binding: RegisterBinding(), ),
        GetPage(name: NamedRoute.routeSingleArticleScreen, page: () => Single()),
        GetPage(name: NamedRoute.routeManageArticleScreen, page: () => ManageArticle(), binding: ManageArticleBinding()),
        GetPage(name: NamedRoute.routeSingleManageArticleScreen, page: () => SingleArticleManage(), binding: ManageArticleBinding()),
      ],
      home: SplashScreen()
    );
  }

  ThemeData lightTheme(Size size, TextTheme textTheme) {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 2)
        ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(width: 1))
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStatePropertyAll(
              Size(size.width/2.54,size.height/15.46)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
          ),
          backgroundColor: const WidgetStatePropertyAll(SolidColors.primaryColor),
          textStyle: WidgetStateProperty.resolveWith((states){
            if(states.contains(WidgetState.pressed)){
              return textTheme.titleMedium;
            }else{
              return textTheme.titleMedium;
            }
          }),
          // foregroundColor: const WidgetStatePropertyAll(Colors.white),
        ),
      ),
      colorScheme: const ColorScheme.light(
        surface: SolidColors.scaffoldBgColor,
        primary: Colors.white,
      ),
        fontFamily: FontFamily.iranYekan,
        textTheme: const TextTheme(
          //headline1
          displayLarge: TextStyle(
            color: SolidColors.posterTitleColor,
              fontSize: 18,
              fontWeight: FontWeight.w700
          ),
            //subtitle1
            titleMedium: TextStyle(
              fontFamily: FontFamily.iranYekan,
              color: SolidColors.posterSubTitleColor,
              fontSize: 14,
              fontWeight: FontWeight.w300
            ),
            bodyLarge: TextStyle(
                fontSize: 14,
                color: SolidColors.textTitleColor,
                fontWeight: FontWeight.w700),
            bodyMedium: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w300),
            headlineMedium: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 70, 70, 70),
                fontWeight: FontWeight.w300),
            headlineSmall: TextStyle(
                fontSize: 14,
                color: SolidColors.hintTextColor,
                fontWeight: FontWeight.w300),
          headlineLarge: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w300),
        ),

    );
  }
}





class NamedRoute{

  static const String routeMainScreen = '/MainScreen';

  static const String routeSingleArticleScreen = '/SingleArticleScreen';

  static const String routeManageArticleScreen = '/ManageArticleScreen';

  static const String routeSingleManageArticleScreen = '/SingleManageArticleScreen';




}