import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_strings.dart';

class MyCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var bodyMargin = size.width/10;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin , left: bodyMargin),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              SvgPicture.asset(
                Assets.images.robot.path,
                height: size.height / 6.18,
                width: size.width / 5.56,
              ),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyStrings.congratulationsText,
                      style: textTheme.bodyMedium!
                          .copyWith(color: SolidColors.primaryColor))),
              TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'نام و نام خانوادگی',
                  hintStyle: textTheme.headlineSmall,
                ),
              ),
              Text(MyStrings.faveCategoriesText ,
                style:textTheme.bodyMedium!
                    .copyWith(color: SolidColors.primaryColor) ,)
            ],
          ),
        ),
      ),
    ));
  }
}
