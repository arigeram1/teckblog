import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/view/main_screen.dart';
import 'package:tec/component/my_colors.dart';

class spalshScreen extends StatefulWidget {
  @override
  State<spalshScreen> createState() => _spalshScreenState();
}

class _spalshScreenState extends State<spalshScreen> {
  @override
  void initState() {

    Future.delayed(const Duration(seconds: 3)).then((value){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: SolidColors.scaffoldBgColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.logo.path,
                width: 120,
                height: 120,
              ),
              const SpinKitFadingCube(
                color: SolidColors.primaryColor,
                size: 40.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
