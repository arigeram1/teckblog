class TagsModel{

  String? id;
  String? title;



  TagsModel({required this.id , required this.title});

  TagsModel.fromJson(Map<String,dynamic> element){

    this.id = element["id"];
    this.title = element["title"];


  }

}