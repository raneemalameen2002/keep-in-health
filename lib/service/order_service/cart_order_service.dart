import 'package:dio/dio.dart';
import 'package:keep_in_health/screens/main.dart';

Dio dio = Dio();

orderToWarehouse(USER_ID)async{
  Response response =await dio.post('${url}/api/user/cart/order?user_id=${USER_ID}');
  print(response.data);
  //return response.data;

  if (response.statusCode==200){
  return true;
 }
 else{
  return false;
 }
}