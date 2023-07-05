import 'package:dio/dio.dart';
import 'endPoint.dart';
class DioHelper{
  static Dio? dio;
  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl: baseURL,
          receiveDataWhenStatusError: true,
          // headers: {
          //   'Content-Type':'application/json',
          //   'Accept':'application/json',
          // }
        )
    );
  }
  static Future<Response> getData({
    required String url,
     Map<String,dynamic>? query,
  })async{
    return await dio!.get(url,queryParameters: query,) ;
  }
  static Future<Response> postData( {
    required String url,
    Map<String,dynamic>? query,
    required  Map<String,dynamic>data,
  })async{
    return await dio!.post(url,
        queryParameters: query,
        data: data,
    ) ;
  }
}
