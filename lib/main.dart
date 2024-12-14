import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec/gen/fonts.gen.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/view/home_screen.dart';
import 'package:tec/view/main_screen.dart';
import 'package:tec/view/mycategories_screen.dart';
import 'package:tec/view/register_intro.dart';
import 'package:tec/view/splash_screen.dart';


void main() {
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
    return MaterialApp(

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('fa')],
      debugShowCheckedModeBanner: false,
      title: 'Tech Blog',
      theme: ThemeData(
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

      ),
      home: MainScreen()
    );
  }
}
