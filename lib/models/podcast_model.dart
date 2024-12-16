import 'package:tec/component/api_constant.dart';

class PodcastModel {

  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  PodcastModel({required this.id , required this.title , required this.poster ,
    required this.catName , required this.author , required this.view ,
    required this.status , required this.createdAt ,
  });

  PodcastModel.fromJson(Map<String,dynamic> element){

    this.id = element["id"];
    this.title = element["title"];
    this.poster =  ApiConstant.domainUrl + element["poster"];
    this.catName = element["cat_name"];
    this.author = element["author"];
    this.view = element["view"];
    this.status = element["status"];
    this.createdAt = element["created_at"];


  }


}

