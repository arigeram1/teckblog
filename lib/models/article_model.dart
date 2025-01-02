import 'package:tec/constant/api_constant.dart';

class ArticleModel {

  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  ArticleModel({ this.id ,  this.title ,  this.image ,
     this.catId ,  this.catName ,  this.author ,
     this.view, this.status ,  this.createdAt
  });


  ArticleModel.fromJson(Map<String,dynamic> element){

     this.id = element["id"];
     this.title = element["title"];
     this.image = ApiConstant.domainUrl + element["image"];
     this.catId = element["cat_id"];
     this.catName = element["cat_name"];
     this.author = element["author"];
     this.view = element["view"];
     this.status = element["status"];
     this.createdAt = element["created_at"];



  }


}



