import 'package:dio/dio.dart';
import 'package:keep_in_health/screens/main.dart';

addToFav(num product_id)async{

  Dio dio = Dio();

  Response response = await dio.post('127.0.0.1:8000/api/user/product/favorite/add',

data: {
  "user_id":1,
  "product_id":product_id
}
);

if(response.statusCode == 200){
  return true;
}else {
  return false;
  
}
}