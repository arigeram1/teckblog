import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tec/constant/my_colors.dart';
import 'package:tec/component/my_component.dart';
import 'package:tec/controller/article/manage_article_controller.dart';
import 'package:tec/controller/article/list_article_controller.dart';
import 'package:tec/controller/file_controller.dart';
import 'package:tec/controller/register_controller.dart';
import 'package:tec/services/file_picker.dart';
import 'package:tec/view/article/article_list_screen.dart';



class SingleArticleManage extends StatelessWidget {

  var manageArticleController = Get.find<ManageArticleController>();
  FileController fileController = Get.put(FileController());

  setTitle(){
    Get.defaultDialog(
      title: 'عنوان مقاله',
      titleStyle: const TextStyle(color: SolidColors.scaffoldBgColor),
      backgroundColor: SolidColors.primaryColor,
      radius: 8,
      content: TextField(
        controller: manageArticleController.titleTextEditingController,
        keyboardType: TextInputType.text,
        style: const TextStyle(color: SolidColors.titleColor),
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
          hintStyle: TextStyle(color: Colors.white),
          hintText: 'اینجا بنویس',
        ),
      ),
      confirm: ElevatedButton(
          onPressed: (){
            manageArticleController.updateTitle();
            Get.back();
          },
          child: Text('ثبت'))
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Obx(
              () => Scaffold(

              body: manageArticleController.loading.value == false
                  ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // top level segment
                    Stack(
                      children: [
                        // single image
                        fileController.file.value.name == 'nothing' ?
                        CachedNetworkImage(
                          imageUrl: manageArticleController
                              .singleArticleModel.value.image!,
                          imageBuilder: (context, imageProvider) => Container(
                            height: size.height / 3.5,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                                color: SolidColors.appbarBackColor),
                          ),
                          placeholder: (context, url) {
                            return const loading();
                          },
                          errorWidget: (context, url, error) {
                            return const Center(
                                child: Icon(
                                  Icons.image_not_supported_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                ));
                          },
                        ) : 
                        Container(
                          height: size.height / 3.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: Image.file(File(fileController.file.value.path!)).image ,
                            fit: BoxFit.cover
                            ),
                            color: SolidColors.appbarBackColor
                          ),
                        )
                        ,
                        
                        // add image button
                        Positioned(
                            left: Get.width/3,
                            right: Get.width/3,
                            bottom: 0,
                            child: InkWell(
                              onTap: () {
                                picFiles();
                              },
                              child: Container(
                                width: Get.width / 5,
                               decoration: const BoxDecoration(
                                 color: SolidColors.primaryColor,
                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                   topRight: Radius.circular(10),
                                 ),
                               ),
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(6, 6, 6, 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('افزودن تصویر' , style: TextStyle(color: Colors.white),),
                                      SizedBox(width: 8,),
                                      Icon(CupertinoIcons.plus , color: Colors.white, size: 18,),
                                    ],
                                  ),
                                )
                                                      ),
                            )),
                        // gradient
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          child: Container(
                            height: size.height / 6,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: GradientColors.headerPostsGradient,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                )),
                          ),
                        ),
                        // app bar
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: size.width,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: const Icon(
                                      Icons.arrow_back,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              //   Expanded(child: SizedBox()),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15 , right: 25),
                      child: Column(
                        children: [
                          //title edit row
                          InkWell(
                              onTap:(){
                                setTitle();
                              },
                              child: titleRow(textTheme , 'ویرایش عنوان مقاله')),
                          // title segment
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: size.width / 1.1,
                            child: Text(
                              manageArticleController
                                  .singleArticleModel.value.title!,
                              style: textTheme.displayLarge!.copyWith(
                                color: Colors.black,
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          //body text edit row
                          const SizedBox(
                            height: 25,
                          ),
                          InkWell(
                              onTap:(){

                              },
                              child: titleRow(textTheme , 'ویرایش متن اصلی مقاله')),
                          // body text
                          const SizedBox(
                            height: 15,
                          ),
                          HtmlWidget(manageArticleController
                              .singleArticleModel.value.content!,
                          textStyle: const
                          TextStyle(height: 1.7 , ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                              onTap:(){

                              },
                              child: titleRow(textTheme , 'انتخاب دسته بندی')),
                          const SizedBox(
                            height: 15,
                          ),

                        ],
                      ),
                    ),

                    scrollTags(size),
                    const SizedBox(
                      height: 50,
                    ),

                    Center(
                      child: ElevatedButton(
                          onPressed: (){
                          },
                          child: const Text('تموم شد')),
                    ),

                    const SizedBox(
                      height: 10,
                    ),


                  ],
                ),
              )
                  : const Center(child: loading())),
        ));
  }



  Widget scrollTags(Size size) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      width: double.infinity,
      height: size.height / 18,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: manageArticleController.relatedTagsList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async{
              var tagId = manageArticleController.relatedTagsList[index].id!;
              await Get.find<ListArticleController>().getArticleListWithTagId(tagId);
              Get.to(ArticleListScreen());
            },
            child: Container(
              padding: const EdgeInsets.only(right: 35, left: 35),
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: SolidColors.tagsColor),
              child: Center(child: Text(manageArticleController.relatedTagsList[index].title!)),
            ),
          );
        },
      ),
    );
  }


}
