import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec/gen/fonts.gen.dart';
import 'package:tec/my_colors.dart';
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
                  fontWeight: FontWeight.w300))),
      home: spalshScreen(),
    );
  }
}
