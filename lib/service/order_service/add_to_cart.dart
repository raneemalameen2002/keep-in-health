import 'package:dio/dio.dart';
import 'package:keep_in_health/screens/main.dart';

addToCart(num user_id,num product_id,num quantity)async{

  Dio dio = Dio();

  Response response = await dio.post('${url}/api/user/cart/add',

data: {
  "user_id":user_id,
  "product_id":product_id,
  "quantity":quantity
}
);

if(response.statusCode == 200){
  return true;
}else {
  return false;
  
}
}