import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keep_in_health/model/detailsProduct.dart';
import 'package:keep_in_health/provider/language.dart';
import 'package:keep_in_health/screens/home_page.dart';
import 'package:keep_in_health/service/favo/add_to_fav.dart';
import 'package:keep_in_health/service/order_service/add_to_cart.dart';
import 'package:keep_in_health/service/order_service/cart_order_service.dart';
import 'package:keep_in_health/service/product_services.dart/product_details_service.dart';
import 'package:keep_in_health/service/product_services.dart/product_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MediDetails extends StatefulWidget {
   MediDetails({super.key, required this.detailsProduct});
DetailsProduct detailsProduct;
  @override
  State<MediDetails> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MediDetails> {
   Language _language = Language();
  List<String> _languages  = ['AR' , 'EN' ];
  String ? _Selectedlanguage;
    getselectedpref()async{

    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      _Selectedlanguage=pref.getString('language');
    });
  }
 
    num? quantity1; 
 bool _isPressed = false;
  @override
   void initState() {

    super.initState();
    getselectedpref();

    setState(()=> _language.getLanguage() );
  }
  Widget build(BuildContext context) {
     String host='http://127.0.0.1:8000';
  String imageOnly=widget.detailsProduct.image.toString();
  String imageWithHost='$host'+'$imageOnly';
    
    return Directionality(textDirection:_language.getLanguage()=="AR"?TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        body: FutureBuilder(
          future: getDetails(id:1),
           builder: (context, status) {
            if (status.hasData) {
              return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 40,),
                   Padding(
                     padding: EdgeInsets.only(left: 20,right: 20),
                     child: Row(
                      children: [
                        IconButton(onPressed: (){
                           Navigator.pop(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        }, icon: Icon(Icons.arrow_back,
                        color: Color(0xff5B4A87),
                        )),
                        Spacer(
                          flex: 1,
                        ),
                      //  IconButton(
                      //              onPressed: ()async{
                      //                  bool state= await addToFav(widget.detailsProduct.id);
                      //                    if(state){
                      //                      print('object');
                      //                     }
                      //                 setState(
                      //                   () {
                      //           _isPressed = !_isPressed;
                      //         },
                      //       );
                      //     },
                      //             icon:Icon(Icons.favorite) ,
                      //             color: _isPressed?Colors.red:Colors.black,
                      //           ),
                      ],
                     ),
                   ),
                  // Container(
                  // //  padding: EdgeInsets.only(top: 75),
                  //   height: 250,
                  //   child:  Image.network(imageWithHost,
                  //   fit: BoxFit.cover,
                    
                  //   ),
                  // ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                        color: Colors.black.withOpacity(0.10000000149011612),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30,),
                            Row(
                              children: [
                                Text(widget.detailsProduct.com_name,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                      
                                ),
                                ),
                                Spacer(flex: 1,),
                                Text(widget.detailsProduct.price.toString(),
                                style: TextStyle(
                                  fontSize: 25,
                                 // fontFamily: "Inspiration",
                                  //fontWeight: FontWeight.bold,
                                ),
                                ),
                                SizedBox(width: 5,),
                                Text('sp')
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text(widget.detailsProduct.sci_name,style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff51025E),
                            ),),
                            SizedBox(height: 15,),
                             Text(widget.detailsProduct.manufacturer,
                                style: TextStyle(
                                  fontSize: 30,
                                 fontFamily: "Inspiration",
                                  //fontWeight: FontWeight.bold,
                                ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text('Enter the quantity you want:',
                                style: TextStyle(color: Color(0xff51025E),
                                fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Container(
                                  width: 150,
                                  child: TextField(
                                     keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))//هون مشان مانسمح للمستخدم يدخل غير ارقام بالكمية 
                                        ],
                                        onChanged: (value) {
                                         setState(() {
                                          quantity1 = num.tryParse(value); 
                                             });
                                            },
                                                cursorColor: Color(0xff4F3476),
                                                decoration: InputDecoration(
                                                  contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(20),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.black.withOpacity(0.10000000149011612),
                                                 
                                                ),
                                              ),
                                ),
                                //SizedBox(height:15),
                                Spacer(flex: 1,),
                                
                               // SizedBox(height: 5,),
                                Row(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
        
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Expiration Date',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff676076),
                                ),),
                                        Text(widget.detailsProduct.expiration_date.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff676076),
                                        ),),
                                      ],
                                    ),
                                    Spacer(flex: 1,),
                                    ElevatedButton(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    minimumSize: Size(150, 50),
    backgroundColor: Color(0xff4F3476),
  ),
  onPressed: () async {
    if (quantity1 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter the quantity"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      setState(() {});
      bool state = await addToCart(1, widget.detailsProduct.id, quantity1!);
      if (state) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Your order sent successfully"),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Please enter the quantity"),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  },
  child: Text('Add To Cart'),
),
                                  ],
                                ),
                                SizedBox(height: 20,),
        
                          ],
                        ),
                      )
                    ),
                  )
                ],
              ),
          );
          
              }
              else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xff660F56),
                                ),
                              );
                            }}
                            
           
        ),
      ),
    );
  }
}