import 'package:dio/dio.dart';
import 'package:keep_in_health/screens/main.dart';

deletFromFav(id)async{
  Dio dio=Dio();
  Response response = await dio.delete("${url}/api/user/product/favorite/delete?user_id=1&product_id=${id.toString()}",);
  print(response.data);
 if (response.statusCode==200){
  return true;
 }
 else{
  return false;
 }
}