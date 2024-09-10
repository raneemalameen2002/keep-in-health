import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
//import 'package:keep_in_health/screens/OnBoarding.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:keep_in_health/provider/language.dart';
import 'package:keep_in_health/screens/favorite.dart';
import 'package:keep_in_health/screens/home_page.dart';
import 'package:keep_in_health/screens/login.dart';
import 'package:keep_in_health/screens/my_orders.dart';
import 'package:keep_in_health/screens/orders.dart';
import 'package:keep_in_health/screens/sign_up.dart';
import 'package:keep_in_health/screens/verifiy_code.dart';
import 'package:keep_in_health/service/order_service/view_orders.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
String language = 'EN';
 String lang='en';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((instance){

    language = instance.getString('language')!;


  });

  runApp(ChangeNotifierProvider(
      create: (context) => Language() ,
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: signup (),

    );
  }  
}

 String  url = "http://127.0.0.1:8000";
 num USER_ID=1;
