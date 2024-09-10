import 'package:dio/dio.dart';
import 'package:keep_in_health/screens/main.dart';

getMyOrders(USER_ID)async{
  Dio dio = Dio();
  Response response =await dio.get('${url}/api/order/index?user_id=${USER_ID}');
  print(response.data);
  return response.data;
}