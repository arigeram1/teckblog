
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class DioService {

  Dio dio = Dio();

  Future<dynamic> getMethod(String url) async{

    dio.options.headers['content-Type'] = 'application/json';
    return await dio.get(url ,
    options: Options(
      responseType: ResponseType.json,
      method: 'GET',

    )
    ).then((response) {
     // log(response.toString());
      return response;
    },).catchError((error){
      if(error is DioException){
        return error.response!;
      }
    });


  }

  Future<dynamic> postMethod(String url , Map<String,dynamic> map) async{

    dio.options.headers['content-Type'] = 'application/json';

    return await dio.post(url , data: dio_service.FormData.fromMap(map),
    options: Options(
      responseType: ResponseType.json,
      method: 'POST'
    )
    ).then((response) {
      return response;
    },).catchError((error) {
      if(error is DioException){
        return error.response!;
      }
    } );


  }



}