import 'package:dio/dio.dart';
import 'package:mom_app/core/network/end_points.dart';

class DioHelper {

  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: BASEURL,
        receiveDataWhenStatusError: true,
         /*headers: {
           'Content-Type':'application/json',
         }*/
      ),
    );
  }
  static Future<Response> getData ({
    required String url,
     Map<String,dynamic>? query,
    String? token ,
  }) async
  {
    dio.options.headers= {
      'Content-Type' : 'application/json',
      'Authorization': token,
    };
    return await dio.get(url, queryParameters : query ,);
  }

  static Future<Response> postData({
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String token = '' ,
  }) async{
    return await dio.post(
        url,
        queryParameters: query,
        data: data);
  }

  static Future<Response> postFormData({
    required String url,
    required FormData  data,
    required String token ,
  }) async{
    /*dio.options.headers={
      'Content-Type' :'multipart/form-data',
      'Authorization': 'Bearer $token',
    };*/
    return await dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
    );
  }

  static Future<Response> putData({
    required String url,
     Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String lang = 'en',
    String token = '' ,
}) async{
    dio.options.headers={
      'Content-Type' : 'application/json',
      'lang' : lang,
      'Authorization': token,
    };
     return await dio.put(
         url,
         queryParameters: query,
         data: data
     );
  }

}