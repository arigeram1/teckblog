
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FileController extends GetxController{

  Rx<PlatformFile> file = PlatformFile(name: 'nothing', size: 0).obs;


}