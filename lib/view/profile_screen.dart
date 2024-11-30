import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_component.dart';
import 'package:tec/my_strings.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: Column(
        children: [
          Image.asset(
            Assets.images.profile.path ,
            height: size.height/7,
          ),
          const SizedBox(height: 10,),
          EditProfileTextRow(bodyMargin: bodyMargin, textTheme: textTheme),
          const SizedBox(height: 50,),
           Text('آرین گرامی' , style: textTheme.displayLarge!.copyWith(color: SolidColors.userNameColor)),
          const SizedBox(height: 6,),
           Text('arigerami@gmail.com', style: textTheme.displayLarge!.copyWith(color: Colors.black)),
          const SizedBox(height: 40,),
          // Divider Segment
          Container(
            height: size.height/13,
            child: Column(
              children: [
                techDivider(size: size),
                InkWell(
                  splashColor: SolidColors.primaryColor,
                  onTap: (){},
                  child:
                  SizedBox(
                      height: size.height/18,
                      child: const Center(child: Text(MyStrings.myFavoriteBlog))),
                ),
              ],
            ),
          ),

          Container(
            height: size.height/13,
            child: Column(
              children: [
                techDivider(size: size),
                InkWell(
                  splashColor: SolidColors.primaryColor,
                  onTap: (){},
                  child:
                  SizedBox(
                      height: size.height/18,
                      child: const Center(child: Text(MyStrings.myFavoritePodcast))),
                ),
              ],
            ),
          ),
          Container(
            height: size.height/13,
            child: Column(
              children: [
                techDivider(size: size),
                InkWell(
                  splashColor: SolidColors.primaryColor,
                  onTap: (){},
                  child:
                  SizedBox(
                      height: size.height/18,
                      child: const Center(child: Text(MyStrings.logOutText))),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60,),
        ],
      ),
    );
  }
}




class EditProfileTextRow extends StatelessWidget {
  const EditProfileTextRow({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageIcon(
          AssetImage(Assets.icons.pencil.path),
          color: SolidColors.titleColor,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          MyStrings.editProfileImage,
          style: textTheme.bodyLarge!
              .copyWith(color: SolidColors.titleColor),
        )
      ],
    );
  }
}