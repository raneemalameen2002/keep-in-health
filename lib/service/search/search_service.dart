import 'package:dio/dio.dart';
import 'package:keep_in_health/screens/main.dart';

searchMedicine(String label)async{
Dio dio = Dio();
Response response = await dio.get('${url}/api/product/index?lang=${lang}&search=${label}');
return response.data;
}
searchCategory(String label)async{
Dio dio1 = Dio();
Response response = await dio1.get('${url}/api/category/index?lang=${lang}&search=${label}');
return response.data;
}