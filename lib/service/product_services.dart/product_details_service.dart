import 'package:dio/dio.dart';
import 'package:keep_in_health/screens/main.dart';

Dio dio = Dio();

getDetails({required int id})async{
  Response response =await dio.get('${url}/api/product/show?id=${id.toString()}&lang=${lang}');
  return response.data;
}