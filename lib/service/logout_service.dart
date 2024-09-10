import 'package:dio/dio.dart';
import 'package:keep_in_health/screens/main.dart';

logOut()async{

  Dio dio = Dio();

  Response response = await dio.post('${url}/api/user/cart/add');

if(response.statusCode == 200){
  return true;
}else {
  return false;
  
}
}