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

  ArticleModel({required this.id , required this.title , required this.image ,
    required this.catId , required this.catName , required this.author ,
    required this.view,required this.status , required this.createdAt
  });


  ArticleModel.fromJson(Map<String,dynamic> element){

     this.id = element["id"];
     this.title = element["title"];
     this.image = element["image"];
     this.catId = element["cat_id"];
     this.catName = element["cat_name"];
     this.author = element["author"];
     this.view = element["view"];
     this.status = element["status"];
     this.createdAt = element["created_at"];



  }


}



