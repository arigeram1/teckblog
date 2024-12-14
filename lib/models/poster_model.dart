class PosterModel{

  String? id;
  String? title;
  String? image;


  PosterModel({required this.id , required this.title , required this.image});

  PosterModel.fromJson(Map<String,dynamic> element){

    this.id = element["id"];
    this.title = element["title"];
    this.image = element["image"];
    
  }

}