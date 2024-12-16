import 'package:tec/component/api_constant.dart';

class PosterModel{

  String? id;
  String? title;
  String? image;


  PosterModel({ this.id ,  this.title , this.image});

  PosterModel.fromJson(Map<String,dynamic> element){

    this.id = element["id"];
    this.title = element["title"];
    this.image = ApiConstant.domainUrl + element["image"];
    
  }

}