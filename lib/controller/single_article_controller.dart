import 'package:get/get.dart';
import 'package:tec/component/api_constant.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/models/single_article_model.dart';
import 'package:tec/models/tags_model.dart';
import 'package:tec/services/dio_service.dart';

class SingleArticleController extends GetxController{

  RxBool loading = false.obs;
  RxString id = RxString('0');
  RxList<ArticleModel> relatedArticleList = RxList<ArticleModel>();
  RxList<TagsModel> relatedTagsList = RxList<TagsModel>();


  Rx<SingleArticleModel> singleArticleModel = SingleArticleModel().obs;


  getArticleInfo() async{
    singleArticleModel = SingleArticleModel().obs;
    loading.value = true;
    var userId = '1';
    var response = await DioService().getMethod(ApiConstant.baseUrl + 'article/get.php?command=info&id=$id&user_id=$userId');

    if(response.statusCode == 200){

      singleArticleModel.value = SingleArticleModel.fromJson(response.data);

      relatedArticleList.clear();
      response.data['related'].forEach((element) {
        relatedArticleList.add(ArticleModel.fromJson(element));
      });
      relatedTagsList.clear();
      response.data['tags'].forEach((element) {
        relatedTagsList.add(TagsModel.fromJson(element));
      });


      loading.value = false;

    }


  }


}