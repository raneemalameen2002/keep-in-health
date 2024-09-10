import 'package:dio/dio.dart';
import 'package:keep_in_health/screens/main.dart';

Dio dio = Dio();
Dio dio1 = Dio();
getToCart(USER_ID)async{
  Response response =await dio.get('${url}/api/user/cart/show?id=${USER_ID}&lang=${lang}');
  print(response.data);
  return response.data;
}

deletFromCart(product_id,user_id)async{
  Response response = await dio1.delete("${url}/api/user/cart/delete",data : {//////////////الحذف
"product_id":product_id,
"user_id":user_id
});
  print(response.data);
 if (response.statusCode==200){
  return true;
 }
 else{
  return false;
 }
}