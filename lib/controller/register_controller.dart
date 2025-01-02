import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec/constant/api_constant.dart';
import 'package:tec/constant/my_strings.dart';
import 'package:tec/constant/storage_const.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/main.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/view/main_screen/main_screen.dart';

import 'package:tec/view/register/register_intro.dart';

class RegisterController extends GetxController {


  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activeCodeTextEditingController = TextEditingController();
  var email ;
  var userId;


  register() async{

    Map<String,dynamic> map = {'email':emailTextEditingController.text , 'command':'register'};

    var response = await DioService().postMethod(ApiConstant.postUrl, map);
      print(response);
     email = emailTextEditingController.text;

     userId = response.data['user_id'];

    // if(response.statusCode == 200 && response.data['response'] == true){
    //
    //
    // }


  }

  verify() async{

    Map<String,dynamic> map =
    {
      'email':email ,
      'user_id':userId,
      'code':activeCodeTextEditingController.text,
      'command':'verify',

    };

    var response = await DioService().postMethod(ApiConstant.postUrl, map);

    var status = response.data['response'];

    switch(status)
    {
      case 'verified':
        var box = GetStorage();

        box.write(StorageConst.token, response.data['token']);
        box.write(StorageConst.userId, response.data['user_id']);

        Get.offAndToNamed('/MainScreen');
        break;

      case 'incorrect_code':
        Get.snackbar('خطا', 'کد وارد شده صحیح نمیباشد');
        break;


      case 'expired':
        Get.snackbar('خطا', 'کد وارد شده منقضی شده است');
        break;

      default:
        log('server error');
        break;

    }


  }


  toggleLogin(){

   

    if(GetStorage().read(StorageConst.token) != null){

      Get.bottomSheet(
          writeBottomSheet()
      );

    }
    else{
      Get.to(RegisterIntro());
    }


  }

  Widget writeBottomSheet() {
    return Container(
          width: double.infinity,
          height: Get.size.height / 3,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20) , topLeft: Radius.circular(20)),

          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 35 , right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(Assets.images.robot.path , width: 45 , height: 45,),
                    const SizedBox(width: 20,),
                    const Text(MyStrings.registerBottomSheetTitle)
                  ],
                ),
                const SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(MyStrings.registerBottomSheetBodyText ,
                    style: TextStyle(fontSize: 13 , height: 1.5),),
                ),
                const SizedBox(height: 32,),
                // last row for create podcast and article
                SizedBox(
                  width: Get.size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        // splashColor: Colors.transparent,
                        onTap: () {
                          Get.offAndToNamed(NamedRoute.routeManageArticleScreen);
                        },
                        child: Container(
                          height: 60,
                          child: Row(
                            children: [
                              Image.asset(Assets.icons.writeArticle.path , width: 35, height: 35,),
                              const SizedBox(width: 15,),
                              const Text('مدیریت مقاله ها'),
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        //     splashColor: Colors.transparent,
                        onTap: () {
                          debugPrint(GetStorage().read(userId).toString());
                        },

                        child: Container(
                          height: 60,
                         // width: 35,
                          child: Row(
                            children: [
                              Image.asset(Assets.icons.createPodcast.path , width: 35, height: 35,),
                              const SizedBox(width: 15,),
                              const Text('مدیریت پادکست ها'),
                              const SizedBox(width: 35,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        );
  }




}