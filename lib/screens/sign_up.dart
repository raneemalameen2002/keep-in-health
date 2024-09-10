import 'package:flutter/material.dart';
import 'package:keep_in_health/screens/login.dart';
import 'package:keep_in_health/screens/verifiy_code.dart';
import 'package:keep_in_health/service/api.dart';
//import 'package:hussam/Home.dart';
//import 'package:hussam/test.dart';
//import 'dart:js_util';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<signup> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  bool keepMeLoggedIn=false;
  bool sec = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus){//هون يعني لغينا تركيز اي عنصر تاني لما نضغط على منطقة خالية
          //مثلا اذا كبسنا عالتيكست فيلد قام طلعت لوحة المفاتيح منقوم اذا ضغطنا ع أي منطقة بالسكاففولد منقلها بيبااااااي
          currentFocus.unfocus();
        }
      },
      child : Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height, // هون ساوينا الحد الادنى لارتفاع الكونتينر هوة ارتفاع الشاشة

            ),
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.end ,
                    children: [
                      Container(
                        height:70 ,
                        width: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/MyMedi logo front-end copy 1 (1).png'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 27),
                  const Text(
                    'Create your account',
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  TextFormField(
                    cursorColor: Colors.white24,
                    controller: nameController,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      hintText:'The Pharmacy Name ',
                      hintStyle: TextStyle(color: Colors.white54,),
                      enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Colors.white24,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Colors.white24,
                        ),
                      ),
                      //border: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(10.0),
                      //),
                    ),
                  ),//name
                  const  SizedBox(
                    height: 31,),
                  TextFormField(
                    cursorColor: Colors.white24,
                    controller: addressController,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      hintText:'Address',
                      hintStyle: TextStyle(color: Colors.white54,),
                      enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Colors.white24,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Colors.white24,
                        ),
                      ),
                      //border: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(10.0),
                      //),
                    ),
                  ),//عنوان
                  const  SizedBox(
                    height: 31,
                  ),
                  TextFormField(
                    cursorColor: Colors.white24,
                    controller: emailController,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      hintText:'Email Address',
                      hintStyle: TextStyle(color: Colors.white54,),
                      enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Colors.white24,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Colors.white24,
                        ),
                      ),
                      //border: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(10.0),
                      //),
                    ),
                  ),//email
                  const  SizedBox(
                    height: 31,),
                  TextFormField(
                    cursorColor: Colors.white24,
                    controller: phoneController,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      hintText:'Phone Number',
                      hintStyle: TextStyle(color: Colors.white54,),
                      enabledBorder: OutlineInputBorder(
                        borderSide :const BorderSide(
                          color: Colors.white24,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                          color: Colors.white24,
                        ),
                      ),
                      //border: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(10.0),
                      //),
                    ),
                  ),//رقم
                  const  SizedBox(
                    height: 31,),
                  TextFormField(
                    cursorColor: Colors.white24,
                    controller: passwordController,
                    obscureText: sec,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            sec = !sec;
                          });
                        },
                        icon: Icon(sec ? Icons.visibility_off : Icons.visibility,
                          color: Color(0xcc2d1055),
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(0, 0, 0, 0.1) ,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white54,),
                      enabledBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                            color: Colors.white24),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.white24),
                      ),
                    ),
                  ),//باسوورد
                  //const  SizedBox(height: 34,),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Colors.white,
                          checkColor: Colors.deepPurpleAccent,
                          value: keepMeLoggedIn,
                          onChanged:(value)
                          {
                            setState(() {
                              keepMeLoggedIn=value!;
                            });
                          }
                      ),
                      const Text(
                        'Remember Me',
                        style: TextStyle(color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xcc2d1055),
                    ),
                    width: double.infinity,
                    height: 55,
                    child: MaterialButton(
                      onPressed: () async {
                        try {
                          final responseData = await Api.register(
                            email: emailController.text,
                            phone_number: phoneController.text,
                            password: passwordController.text,
                            pharmacy_name: nameController.text,
                            pharmacy_address: addressController.text,
                            //pharmacy_license: licenseController.text, // تأكيد استخدام اسم الحقل الصحيح
                          );
Navigator.push(context, MaterialPageRoute(builder: (context) =>  RegisterScreen()));
                          if (responseData != null) {
                            // تم التسجيل بنجاح
                            print('Successfully registered. Response data: $responseData');
                            
                            // يمكنك إجراء أي إجراءات إضافية هنا بناءً على الرد المتلقى
                          } else {
                            // فشل التسجيل
                            print('Registration failed.');
                          }
                        } catch (error) {
                          print('Error: $error');
                          // عرض رسالة خطأ عند فشل التسجيل
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Failed to register. Please check your information.',
                                style: TextStyle(fontSize: 16),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }

                        // إذا كان لديك إجراءات إضافية بعد التسجيل يمكنك إضافتها هنا.

                        print(nameController.text);
                        print(addressController.text);
                        print(phoneController.text);
                        print(emailController.text);
                        print(passwordController.text);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text(
                        'already have an account?',
                        style: TextStyle(fontWeight: FontWeight.w900,fontSize:14 ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  Login()),
                          );
                        },
                        child: Text(
                          'Sign In ',
                          style: TextStyle(
                            color: Color(0xff513876),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),);
  }
}