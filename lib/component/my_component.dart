
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