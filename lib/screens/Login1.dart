// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:keep_in_health/screens/home_page.dart';
// import 'package:keep_in_health/screens/Register.dart';
// import 'package:http/http.dart' as http;
// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginScreenState();
// }


// // ? THESE NEED TO GET FROM LOGIN PART
// num USER_ID = 1;

// class _LoginScreenState extends State<Login> {




//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   bool keepMeLoggedIn=false;
//   bool sec = true;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         FocusScopeNode currentFocus = FocusScope.of(context);
//         if(!currentFocus.hasPrimaryFocus){//هون يعني لغينا تركيز اي عنصر تاني لما نضغط على منطقة خالية
//           //مثلا اذا كبسنا عالتيكست فيلد قام طلعت لوحة المفاتيح منقوم اذا ضغطنا ع أي منطقة بالسكاففولد منقلها بيبااااااي
//           currentFocus.unfocus();
//         }
//       },
//       child: Scaffold( // عملنا للسكافلد راب مع الجيستر ديتيكتر مشان اذا كبسنا بأي ارنة بالشاشة ينزل الكيبورد
//         body: SingleChildScrollView(
//           child: Container(
//             constraints: BoxConstraints(
//               minHeight: MediaQuery.of(context).size.height, // هون ساوينا الحد الادنى لارتفاع الكونتينر هوة ارتفاع الشاشة

//             ),
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/background.png'),
//                 fit: BoxFit.cover,

//               ),
//             ),


//             child: Container(

//               padding: const EdgeInsets.all(40.0),

//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children:
//                 [
//                   SizedBox(height: 20,),
//                   Row(
//                     mainAxisAlignment:MainAxisAlignment.end ,
//                     children: [
//                       Container(
//                         height:70 ,
//                         width: 70,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage('assets/MyMedi logo front-end copy 1 (1).png'),
//                             fit: BoxFit.cover,
//                           )
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 65),
//                   const Text(
//                     'Login Your Account',
//                     style: TextStyle(
//                       fontSize: 29,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 39,
//                   ),
//                   TextFormField(
//                     cursorColor: Colors.white24,
//                     controller: emailController,
//                     onFieldSubmitted: (String value) {
//                       print(value);
//                     },
//                     onChanged: (String value) {
//                       print(value);
//                     },
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.black12,
//                       hintText:'Phone number',
//                       hintStyle: const TextStyle(color: Colors.white54,),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide:const BorderSide(
//                           color: Colors.white24,
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(
//                           color: Colors.white24,
//                         ),
//                       ),

//                     ),
//                   ),
//                   const SizedBox(
//                     height: 34,),
//                   TextFormField(
//                     cursorColor: Colors.white24,
//                     controller: passwordController,
//                     obscureText: sec,
//                     onFieldSubmitted: (String value) {
//                       print(value);
//                     },
//                     onChanged: (String value) {
//                       print(value);
//                     },
//                     keyboardType: TextInputType.visiblePassword,
//                     decoration: InputDecoration(
//                       suffixIcon: IconButton(
//                         onPressed: (){
//                           setState(() {
//                             sec = !sec;
//                           });
//                         },
//                         icon: Icon(sec ? Icons.visibility_off : Icons.visibility,
//                         color: Color(0xcc2d1055),
//                         ),
//                       ),
//                       filled: true,
//                       fillColor: const Color.fromRGBO(0, 0, 0, 0.1) ,
//                       hintText: 'Password',
//                       hintStyle: const TextStyle(color: Colors.white54,),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(
//                             color: Colors.white24),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       focusedBorder:  OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(
//                             color: Colors.white24),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 7,),
//                   Row(
//                     children: [
//                       Checkbox(
//                           activeColor: Colors.white,
//                           checkColor: Colors.deepPurpleAccent,
//                           value: keepMeLoggedIn,
//                           onChanged:(value)
//                           {
//                             setState(() {
//                               keepMeLoggedIn=value!;
//                             });
//                           }
//                       ),
//                       const Text(
//                         'Remember Me',
//                         style: TextStyle(color: Colors.black,
//                           fontSize: 10,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 7,),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: const Color(0xcc2d1055),
//                     ),
//                     width: double.infinity,
//                     height: 55,
//                     child: MaterialButton(
//                       onPressed: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(builder: (context) => Home()),
//                         // );
                        
//                         print(emailController.text);
//                         print(passwordController.text);
//                       },
//                       child: const Text(
//                         'Log In',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 16,),
//                   const SizedBox(
//                     height: 15,),
//                   Container(
//                     margin: const EdgeInsets.symmetric(vertical: 30),
//                     child: const Row(
//                       children: [
//                         Expanded(child: Divider(indent: 2.0,color: Colors.black,),),
//                         SizedBox(width: 20,),
//                         Text('or',style: TextStyle(fontWeight: FontWeight.w900,color:Color(0xff513876) ),),
//                         SizedBox(width: 20,),
//                         Expanded(child: Divider(indent: 2.0,color: Colors.black,),),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children:
//                     [
//                       const Text(
//                         'Dont have an account?',
//                         style: TextStyle(fontWeight: FontWeight.w900,fontSize:17 ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) =>  signup()),
//                           );
//                         },
//                         child: const Text(
//                           'Sing UP',
//                           style: TextStyle(
//                             color: Color(0xff513876),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }