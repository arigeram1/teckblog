import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_strings.dart';
import 'package:validators/validators.dart';
class RegisterIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: در این بخش به طراحی صفحه ابتدایی و اینترو ثبت نام پرداخته میشود
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
  //  RegExp isEmail = RegExp('^[a-z-0-9]+@');
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.robot.path,
              height: size.height / 6.18,
              width: size.width / 5.56,
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyStrings.welcomeText,
                    style: textTheme.bodyMedium!
                        .copyWith(color: SolidColors.RegisterColor))),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton(
              // show bottom sheet for get email
              onPressed: () {

                _showEmailBottomSheet(context, size, textTheme);
              },
              child: const Text('بزن بریم'),
            ),
          ],
        ),
      ),
    ));
  }

  Future<dynamic> _showEmailBottomSheet(BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  // button sheet container
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      width: double.infinity,
                      height: size.height / 2.57,
                      decoration: const BoxDecoration(
                          color: SolidColors.scaffoldBgColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(MyStrings.enterEmailText),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                size.width / 7, 5, size.width / 7, 30),
                            child: TextField(
                              style: textTheme.headlineLarge,
                              onChanged: (value) {
                              },
                              textAlign: TextAlign.center,
                              autocorrect: false,
                              enableSuggestions: false,
                              decoration: InputDecoration(
                                  hintText: 'techblog@gmail.com',
                                  hintStyle: textTheme.headlineSmall),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                 Navigator.pop(context);
                                _activateCodeBottomSheet(context, size, textTheme);
                              }, child: const Text('ادامه'))
                        ],
                      ),
                    ),
                  );
                },
              );
  }
  Future<dynamic> _activateCodeBottomSheet(BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        // button sheet container
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            width: double.infinity,
            height: size.height / 2.57,
            decoration: const BoxDecoration(
                color: SolidColors.scaffoldBgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(MyStrings.enterActivateCodeText),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      size.width / 7, 5, size.width / 7, 30),
                  child: TextField(
                    style: textTheme.headlineLarge,
                    onChanged: (value) {

                    },
                    textAlign: TextAlign.center,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(width: 2)),
                        hintText: '******',
                        hintStyle: textTheme.headlineSmall),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text('ادامه'))
              ],
            ),
          ),
        );
      },
    );
  }
}

void showSnackBar(BuildContext context,String msg , Color color){

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content:
      Row(
        children: [
          Text(msg),
          TextButton(onPressed: (){}, child: Text('تایید'))
        ],
      )
      , backgroundColor: color, )
  );


}
