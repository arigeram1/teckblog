import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:tec/controller/file_controller.dart';


FileController fileController = Get.put(FileController());

Future picFiles() async{

  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

  fileController.file.value = result!.files.first;





}