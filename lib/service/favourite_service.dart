import 'package:dio/dio.dart';
import 'package:keep_in_health/screens/main.dart';

Dio dio = Dio();

getToFavourite()async{
  Response response =await dio.get('${url}/api/user/product/favorite/index?id=1');
  print(response.data);
  return response.data;
}