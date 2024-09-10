import 'package:dio/dio.dart';
import 'package:keep_in_health/screens/main.dart';

Dio dio = Dio();

getProduct({int id =1})async{
  Response response =await dio.get('${url}/api/category/show?id=${id.toString()}&lang=${lang}');
  return response.data;
}