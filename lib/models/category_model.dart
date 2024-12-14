class CategoryModel {


  String? id;
  String? title;



  CategoryModel({required this.id , required this.title});

  CategoryModel.fromJson(Map<String,dynamic> element){

    this.id = element["id"];
    this.title = element["title"];


  }


}