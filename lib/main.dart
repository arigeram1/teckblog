import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec/gen/fonts.gen.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('fa')],
      debugShowCheckedModeBanner: false,
      title: 'Tech Blog',
      theme: ThemeData(
          fontFamily: FontFamily.iranYekan,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(
                  fontSize: 14,
                  color: SolidColors.textTitleColor,
                  fontWeight: FontWeight.w700),
              bodyMedium: TextStyle(
                  fontSize: 14,
                  color: Color(0xff2C7DB4),
                  fontWeight: FontWeight.w300),
              headlineMedium: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 70, 70, 70),
                  fontWeight: FontWeight.w300))),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 70,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: GradientColors.bottomNavGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight
              ),

          ),
           ),
      ),
    ));
  }
}
