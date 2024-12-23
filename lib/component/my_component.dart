
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec/component/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';
class techDivider extends StatelessWidget {
  const techDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      indent: size.width/5,
      endIndent: size.width/5,);
  }
}

 myLaunchUrl(String url) async{
   var uri = Uri.parse(url);
   await launchUrl(uri);

}

class loading extends StatelessWidget {
  const loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: SolidColors.primaryColor,
      size: 40.0,
    );
  }
}

PreferredSize CustomizeAppbar(TextTheme textTheme , String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: Padding(
      padding: const EdgeInsets.only(left: 40, right: 20 , top: 20),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Text(title , style: textTheme.displayLarge!.copyWith(color: Colors.black),),
        ],
        leading: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: SolidColors.appbarBackColor
          ),
          child:
          const Icon(Icons.arrow_back, size: 33, color: Colors.white,),
        ),
      ),
    ),
  );
}