import 'dart:io';

import 'package:dio/dio.dart';


enum RequestType {GET, POST}

class HttpUtil {

  static getData(String url, Map<String, String> params) async {
    try {
      Response response;
      Options option = Options(
          method: RequestType.GET.toString(),
          responseType: ResponseType.json
      );
      Dio dio=Dio();
      response = await dio.get(url, queryParameters: params, options: option);
      print('response:'+response.toString());
      var res = response.data;
      return res;
    } on DioError catch (error) {
      return print('dio get error:======>$error');
    }
  }


  static postData(String url,  Map<String, dynamic> params) async {
    try {
      if(params == null) {
        params = Map();
      }
      Response response;
      Options options = Options(
          method: RequestType.POST.toString(),
          responseType: ResponseType.json,
          headers: const {'Content-Type': 'application/json'},
          contentType: ('application/x-www-form-urlencoded')
      );
      Dio dio=Dio();
      response = await dio.request(url, data: params, options: options);
      var res = response.data;
      print('response:'+response.toString());
      return res;
    } on DioError catch (error) {
      return print('dio post error:======>$error');
    }
  }

}