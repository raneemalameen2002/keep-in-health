import 'package:dio/dio.dart';
import 'package:keep_in_health/screens/main.dart';

getOrders(id)async{
  Dio dio = Dio();
  Response response =await dio.get('${url}/api/order/show?order_id=${id}&lang=${lang}');
  print(response.data);
  return response.data;
}

