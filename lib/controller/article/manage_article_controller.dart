import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tec/constant/api_constant.dart';
import 'package:tec/models/article_model.dart';
import 'package:tec/models/single_article_model.dart';
import 'package:tec/models/tags_model.dart';
import 'package:tec/services/dio_service.dart';


class ManageArticleController extends GetxController{

  RxList<ArticleModel> articleList = RxList();
  TextEditingController titleTextEditingController = TextEditingController();
  RxBool loading = false.obs;
  Rx<SingleArticleModel> singleArticleModel = SingleArticleModel(

    '۵ بازی مشابه Assassin’s Creed Valhalla که باید بازی کنید',
    'وایکینگ‌ها را روایت می‌کند و جنبه‌های اکشن ادونچر (ماجراجویی) آن با تکیه بر المان‌های نقش‌آفرینی گیمرهای زیادی را به تحسین وا داشته است. در این بین باید اشاره کنیم که بسته الحاقی Dawn of Ragnarok هم مدتی است که عرضه شده و اگر طرفدار این بازی باشید به احتمال زیاد تا به الآن باید',
    'https://techblog.sasansafari.com/Techblog/assets/upload/images/article/20220904181457.jpg',


  ).obs;

  RxList<TagsModel> relatedTagsList = RxList([
    TagsModel(id: '1', title: 'اخبار و مقالات'),
    TagsModel(id: '2', title: 'بازی'),
    TagsModel(id: '3', title: 'سرگرمی'),
  ]);

  @override
  onInit(){
    super.onInit();
    getManageArticle();
  }


  updateTitle(){
    singleArticleModel.update((val) {
      val!.title = titleTextEditingController.text;
    },);

  }


  getManageArticle() async{

    articleList.clear();

    loading.value = true;

    var response = await DioService().getMethod(ApiConstant.publishedByMe);

    if(response.statusCode == 200){

      response.data.forEach((element){

        articleList.add(ArticleModel.fromJson(element));

      });

    }

    loading.value = false;

  }





}