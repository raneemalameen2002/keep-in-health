import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class OnBoarding extends StatelessWidget {
 const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    //     Timer(Duration(seconds: 5), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => Login()),
    //   );
    // });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 60),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/medicineOnboarding2.png'),
            // SizedBox(height: 10),
             const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 38,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10,),
//                  SpinKitFadingCircle(
//   itemBuilder: (BuildContext context, int index) {
//     return DecoratedBox(
//       decoration: BoxDecoration(
//         color: index.isEven ? Colors.red : Colors.green,
//       ),
//     );
//   },
// ),
Row(mainAxisAlignment: MainAxisAlignment.center,
  children: [
         SpinKitRotatingCircle(
    
      color: Color(0xffC7A2FA),
    
      size: 20.0,
    
    ),
     SizedBox(width: 5,),
    SpinKitRotatingCircle(
    
      color: Color(0xff503776),
    
      size: 20.0,
    
    ),
    SizedBox(width: 5,),
     SpinKitRotatingCircle(
    
      color: Color(0xffC7A2FA),
    
      size: 20.0,
    
    ),
  ],
),
            //  Row(children: [
            //   TweenAnimationBuilder(tween: tween, duration: duration, builder: builder)
            //  ],)
            ],
          ),
        ),
      
    );
  }
}