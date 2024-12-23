

import 'package:tec/component/api_constant.dart';

class SingleArticleModel {

  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  SingleArticleModel();

  SingleArticleModel.fromJson(Map<String,dynamic> element ){

    this.id = element['info']['id'];
    this.title = element['info']['title'];
    this.content = element['info']['content'];
    this.image = ApiConstant.domainUrl + element['info']['image'];
    this.catId = element['info']['cat_id'];
    this.catName = element['info']['cat_name'];
    this.author = element['info']['author'];
    this.view = element['info']['view'];
    this.status = element['info']['status'];
    this.createdAt = element['info']['created_at'];
    this.isFavorite = element['isFavorite'];




  }


}
