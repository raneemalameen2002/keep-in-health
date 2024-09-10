import 'package:flutter/cupertino.dart';
import 'package:keep_in_health/screens/home_page.dart';
import 'package:keep_in_health/screens/main.dart';

import '../screens/main.dart';

class Language with ChangeNotifier{
  String  _lang =language;

  getLanguage(){

    return _lang;
  }
  setLanguage(String lang){
    _lang = lang;
    notifyListeners();

  }
//change language screen translate

  String ?tlanguage(){

    if(getLanguage() == 'AR')
      return 'اللغة';
    else
      return 'language';

  }

//Addtocart3 screen translate


  String ?tmedicinename(){

    if(getLanguage() == 'AR')
      return 'اوغمنتين';
    else
      return 'Augamatix';

  }

  String ?tmedicinesiencname(){

    if(getLanguage() == 'AR')
      return 'اموكسيلين';
    else
      return 'amoxicillin';

  }
  String ?tcompanyname(){

    if(getLanguage() == 'AR')
      return '           افينزور';
    else
      return 'AVENZOR   ';

  }

  String ?tToTalpayble(){

    if(getLanguage() == 'AR')
      return 'السعر الكلي';
    else
      return 'TOTAL PAYBLE';

  }

  String ?tDetails(){

    if(getLanguage() == 'AR')
      return 'التفاصيل';
    else
      return 'Details';

  }

  String ?ttafasel(){

    if(getLanguage() == 'AR')
      return '1000 مغ/ 14 قطعة ';
    else
      return '1000 mg / 14 F.C.Tablets';

  }

  String ?tExiration(){

    if(getLanguage() == 'AR')
      return 'تاريخ الانتهاء';
    else
      return 'Expiration';

  }


  String ?tAddcard(){

    if(getLanguage() == 'AR'){
      return 'اضافة الى السلة';
      SizedBox(height: 30,);
    }
    else
      return 'Add to card';

  }


  String ?tSYp(){

    if(getLanguage() == 'AR')
      return 'ل س';
    else
      return 'SYP';

  }

  String ?torder(){

    if(getLanguage() == 'AR')
      return 'تاكيد الطلب';
    else
      return 'Order Confirmation';

  }

  String ?torder2(){

    if(getLanguage() == 'AR')
      return 'تمت الاضافة الى قائمة الطلبات';
    else
      return 'Your order has been added to the cart.';

  }

  String ?tok(){

    if(getLanguage() == 'AR')
      return 'تم';
    else
      return 'OK';

  }

  //my order screen
  String ?tmyorder(){

    if(getLanguage() == 'AR')
      return 'سلتي';
    else
      return 'My Cart';

  }

  String ?tHome(){

    if(getLanguage() == 'AR')
      return 'الرئيسية';
    else
      return 'Home';

  }

  String ?tfavorit(){

    if(getLanguage() == 'AR')
      return 'المفضلة';
    else
      return 'Favorit';

  }
  //welcome page

  String ?twelcom(){

    if(getLanguage() == 'AR')
      return 'اهلاَ';
    else
      return 'Welcom';

  }

  //Login page

  String ?tLogin(){

    if(getLanguage() == 'AR')
      return 'تسجيل الدخول';
    else
      return 'Login your account';

  }


  String ?tphonNumber(){

    if(getLanguage() == 'AR')
      return 'رقم الموبايل';
    else
      return 'Phone number';

  }

  String ?tpassword(){

    if(getLanguage() == 'AR')
      return 'كلمة السر';
    else
      return 'Password';

  }

  String ?tLoginn(){

    if(getLanguage() == 'AR')
      return 'تسجيل دخول';
    else
      return 'Log In';

  }

  String ?tor(){

    if(getLanguage() == 'AR')
      return 'أو';
    else
      return 'or';

  }

  String ?tdonthave(){

    if(getLanguage() == 'AR')
      return 'لا تملك حساب ؟';
    else
      return 'Dont have an account?';

  }

  String ?tSignUp(){

    if(getLanguage() == 'AR')
      return 'تسجيل';
    else
      return 'Sign Up';

  }

  //Sign up

  String ?tCreat(){

    if(getLanguage() == 'AR')
      return 'انشئ حسابك';
    else
      return 'Create your account';

  }

  String ?tpharmacy(){

    if(getLanguage() == 'AR')
      return 'اسم الصيدلية';
    else
      return 'The Pharmacy Name';

  }

  String ?tLiscense(){

    if(getLanguage() == 'AR')
      return 'ترخيص الصيدلية';
    else
      return 'Liscense';

  }

  String ?tAddress(){

    if(getLanguage() == 'AR')
      return 'العنوان';
    else
      return 'Address';

  }

  String ?tEmail(){

    if(getLanguage() == 'AR')
      return 'الايميل';
    else
      return 'Email Address';

  }

  String ?tremember(){

    if(getLanguage() == 'AR')
      return 'ذكرني لاحقا';
    else
      return 'Remember Me';

  }

  String ?talready(){

    if(getLanguage() == 'AR')
      return 'هل لديك حساب بالفعل؟';
    else
      return 'already have an account?';

  }

  //Home page
  String ?twelcomuser(){

    if(getLanguage() == 'AR')
      return 'الرئيسية';
    else
      return 'HOME';

  }


  String ?tsearch(){

    if(getLanguage() == 'AR')
      return 'بحث';
    else
      return 'search';

  }

  String ?torderNow(){

    if(getLanguage() == 'AR')
      return 'اطلب الآن';
    else
      return 'Order Now';

  }

  String ?tlogout(){

    if(getLanguage() == 'AR')
      return 'تسجيل الخروج';
    else
      return 'LogOut';

  }

String ?tmenu(){

    if(getLanguage() == 'AR')
      return 'القائمة';
    else
      return 'Menu';

  }
  String ?timpra(){

    if(getLanguage() == 'AR')
      return 'قيد التحضير';
    else
      return 'InPreparation';

  }
  String ?tsend(){

    if(getLanguage() == 'AR')
      return 'تم الارسال';
    else
      return 'Sent';

  }
  String ?tresev(){

    if(getLanguage() == 'AR')
      return 'تم الاستلام';
    else
      return 'Recieved';

  }

String ?tordernow(){

    if(getLanguage() == 'AR')
      return 'اطلب الآن';
    else
      return 'Order Now';

  }

String ?tveworder(){

    if(getLanguage() == 'AR')
      return 'عرض الطلبات';
    else
      return 'View Orders';

  }


String ?tordersta(){

    if(getLanguage() == 'AR')
      return 'حالة الطلب : ';
    else
      return 'Order Status :';

  }

  
String ?tTooalPrice(){

    if(getLanguage() == 'AR')
      return 'السعر الكلي : ';
    else
      return 'Total Price : ';

  }

  String ?tmidicen(){

    if(getLanguage() == 'AR')
      return 'دواء';
    else
      return 'Medicine';

  }

  String ?tgatog(){

    if(getLanguage() == 'AR')
      return 'تصنيف';
    else
      return 'Category';

  }






}