import 'package:get/get.dart';
import 'package:tec/controller/article/list_article_controller.dart';
import 'package:tec/controller/article/manage_article_controller.dart';
import 'package:tec/controller/register_controller.dart';
import 'package:tec/controller/article/single_article_controller.dart';



//todo به ازای هر صفحه میتونیم یک کلاس مربوط به بایندیگ و تزریق وابستگی های اون درست کنیم
// که در اینحا برای صفحات مربوط به نمایش مقالات یعنی صفحه articlelist و singlearticle که
// هر دو نیاز به کنترل های خود دارند یک کلاس بایند درست کردیم
// تا نیاز نباشه هر دفعه بالای هر ویو get.put رو انجام بدیم و وابستگی هارو اول به گت تزریف کنیم
// و بعد از مخزن بخونیمش
class ArticleBinding implements Bindings{

  @override
  void dependencies() {
    Get.put(ListArticleController());
    Get.lazyPut(() => SingleArticleController(),);
  }

}


class RegisterBinding implements Bindings{

  @override
  void dependencies() {
    Get.put(RegisterController());
  }


}


class ManageArticleBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ManageArticleController(),);
  //  Get.lazyPut(() => SingleArticleController());
  }

}

