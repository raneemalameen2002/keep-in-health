import 'package:dio/dio.dart';
import 'package:keep_in_health/screens/main.dart';

getCategory()async{
  Dio dio=Dio();
  Response response=await dio.get('${url}/api/category/index?lang=${lang}');
  return response.data;
}