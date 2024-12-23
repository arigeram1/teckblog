import 'package:get/get.dart';
import 'package:tec/component/api_constant.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/models/podcast_model.dart';
import 'package:tec/models/poster_model.dart';
import 'package:tec/models/tags_model.dart';
import 'package:tec/services/dio_service.dart';

class HomeScreenController extends GetxController{

  Rx<PosterModel> poster =  PosterModel().obs;

  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastList = RxList();
  RxBool loading = false.obs;
  @override
  onInit(){
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async{

    // start of the commands for this get method

    loading.value = true;


    var response = await DioService().getMethod(ApiConstant.getHomeItems);


    if(response.statusCode == 200){

      // article

      response.data['top_visited'].forEach((element) {

        topVisitedList.add(ArticleModel.fromJson(element));


      });

      // podcast

      response.data['top_podcasts'].forEach((element){


        topPodcastList.add(PodcastModel.fromJson(element));


      });

      // poster

      poster.value = PosterModel.fromJson(response.data['poster']);

      //tags

      response.data['tags'].forEach((element){

        tagsList.add(TagsModel.fromJson(element));

      });

      // end of the commands for this get method

      loading.value = false;


    }

  }


}