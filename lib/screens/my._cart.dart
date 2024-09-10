import 'package:flutter/material.dart';
import 'package:keep_in_health/components/item_my_cart.dart';
import 'package:keep_in_health/model/cart_product.dart';
import 'package:keep_in_health/provider/language.dart';
import 'package:keep_in_health/screens/favorite.dart';
import 'package:keep_in_health/screens/home_page.dart';
import 'package:keep_in_health/screens/main.dart';
import 'package:keep_in_health/screens/my_orders.dart';
import 'package:keep_in_health/screens/orders.dart';
import 'package:keep_in_health/service/cart_service.dart';
import 'package:keep_in_health/service/order_service/cart_order_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});
  @override
  State<MyCart> createState() => _myorderState();
}

class _myorderState extends State<MyCart> {
  Language _language = Language();
  List<String> _languages  = ['AR' , 'EN' ];
  String ? _Selectedlanguage;
  int currentIndex = 0;
  int selectedIndex = 0;
  @override
  void initState() {

    super.initState();
    getselectedpref();

    setState(()=> _language.getLanguage() );
  }
  Widget build(BuildContext context) {
      if(
  _language.getLanguage()=="AR"
){
   lang='ar';
}
 if(
  _language.getLanguage()=="EN"
){
   lang='en';
}
    return Directionality(textDirection:_language.getLanguage()=="AR"?TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Color(0xffB0A4D8),
          child: Column(
            children: [
              SizedBox(height:50 ,),
                Text(_language.tmenu()!,
                  style: TextStyle(
                    color: Color(0xff660F56),
                    fontSize: 40,
                  ),),
                SizedBox(
                  height: 40,
                ),
    
                GestureDetector(
                  onTap: (){print('language');},///////هون منحط العملية يلي رح تصير وقت نكبس
                  child: ListTile(
                      title: Text(
    
                          _language.tlanguage()!
                      ),
                      leading: Icon(Icons.language),
                      trailing: DropdownButton(
                          hint:  Text('language'),
                          value: _Selectedlanguage,
                          onChanged: (newvalue) async {
                            SharedPreferences pref = await SharedPreferences.getInstance();
                            pref.setString('language', newvalue!);
                            _language.setLanguage(newvalue);
                            language =newvalue;
                            setState(() {
                              _Selectedlanguage = newvalue!;
                            });
                          },items: _languages.map((lang){
                        return DropdownMenuItem(child: new Text(lang) ,
                          value: lang,);}).toList())
    
                  ),
                ),
                GestureDetector(
                  onTap: (){print('LogOut');},///////هون منحط العملية يلي رح تصير وقت نكبس
                  child: ListTile(
                    leading: Icon(Icons.logout,
                      color: Colors.black,),
                    title: Text(_language.tlogout()!),
                  ),
                ),
                 Spacer(flex: 1,),
                Container(
                  height:150 ,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/MyMedi logo front-end copy 1 (1).png'),
                        fit: BoxFit.cover,
                      )
                  ),
                ),///////هون منحط العملية يلي رح تصير وقت نكبس
              
            ],
          ),
        ),
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      children: [
                        Builder(builder: (context) {
                          return IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const Drawer()));
                            },
                            icon: Icon(Icons.menu),
                          );
                        }),
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          _language.tmyorder()!,
                          style: TextStyle(fontSize: 25),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Image.asset(
                          "assets/MyMedi logo front-end copy 1 (1).png",
                          height: 50,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Center(
                    //   child: Container(
                    //     height: 70,
                    //     width: 360,
                    //     child: TextFormField(
                    //       cursorColor: Colors.white24,
                    //       controller: emailController,
                    //       onFieldSubmitted: (String value) {
                    //         print(value);
                    //       },
                    //       onChanged: (String value) {
                    //         print(value);
                    //       },
                    //       keyboardType: TextInputType.visiblePassword,
                    //       decoration: InputDecoration(
                    //         filled: true,
                    //         fillColor: const Color.fromRGBO(0, 0, 0, 0.1) ,
                    //         hintText: 'search',
                    //         hintStyle: const TextStyle(color: Colors.white54,),
                    //         enabledBorder: OutlineInputBorder(
                    //           borderSide: const BorderSide(
                    //               color: Colors.white24),
                    //           borderRadius: BorderRadius.circular(10.0),
                    //         ),
                    //         focusedBorder: const OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: Colors.white24),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: FutureBuilder(
                          future: getToCart(USER_ID),
                          builder: (context, status) {
                            if (status.hasData) {
                              dynamic temp = status.data;
                              List<CartProduct> cartProduct = List.generate(
                                  temp['data']['Products'].length, ///////////////////هون الغلط
                                  (index) => CartProduct.fromMap(
                                      temp['data']['Products'][index]));
                              return ListView.separated(
                                  itemCount: cartProduct.length,
                                  separatorBuilder: (context, index) => Divider(
                                      indent: 1, color: Colors.grey, height: 5),
                                  itemBuilder: (BuildContextcontext, int index) {
                                    return Dismissible(
                                        background: Container(
                                          color: Colors.red,
                                        ),
                                        key: GlobalKey(),
                                        onDismissed: (direction) async {
                                          if (direction ==
                                              DismissDirection.endToStart) {
                                            if (await deletFromCart(
                                                cartProduct[index].product_id,
                                                cartProduct[index].user_id)) {
                                              setState() {
                                                print("anything");
                                              }
                                            }
                                          }
                                        },
                                        
                                        child: ItemMyCart(
                                          cartProductObj: cartProduct[index],
                                        ));
                                      });
                                    } else {
                                      return Center(
                                       child: CircularProgressIndicator(
                                  color: Color(0xff660F56),
                                   
                                ),
    
                              );
                            }
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                         //crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                //margin: EdgeInsets.symmetric(vertical:10),
                                //padding: EdgeInsets.symmetric(vertical: 15),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(150, 45),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      backgroundColor: Color(0xff660F56),
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        
                                      });
                                      bool state = await orderToWarehouse(1);
                                      if (state) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(new SnackBar(
                                          content:
                                              Text("your order sent succesfully "),
                                          backgroundColor: Colors.green,
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(new SnackBar(
                                          content:
                                              Text("your order sent succesfully "),
                                          backgroundColor: Colors.red,
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(_language.torderNow()!),
                                    ))),
                                    SizedBox(height: 10,),
                                      Container(
                                //margin: EdgeInsets.symmetric(vertical:10),
                                //padding: EdgeInsets.symmetric(vertical: 15),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(150, 45),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      backgroundColor: Color(0xff5B4A87),
                                    ),
                                    onPressed: () async {
                                     Navigator.push(context, MaterialPageRoute( builder: (context) =>Orders() ));
                                      setState(() {
                                        
                                      });
                                     // bool state = await orderToWarehouse(1);
                                    //   if (state) {
                                    //     ScaffoldMessenger.of(context)
                                    //         .showSnackBar(new SnackBar(
                                    //       content:
                                    //           Text("your order sent succesfully "),
                                    //       backgroundColor: Colors.green,
                                    //       behavior: SnackBarBehavior.floating,
                                    //     ));
                                    //   } else {}
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(_language.tveworder()!),
                                    ))),
                          ],
                        ),
                      ],
                    ),
                   
    
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                              );
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.home_outlined,
                                  size: 35,
                                ),
                                Text(_language.tHome()!)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
                            child:  Column(
                              children: [
                                Icon(Icons.shopping_cart,
                                    size: 35, color: Color(0xcc2d1055)),
                                Text(
                                  _language.tmyorder()!,
                                  style: TextStyle(color: Color(0xcc2d1055)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => favorat()),
                              );
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  size: 35,
                                ),
                                Text(
                                  _language.tfavorit()!,
                                  style: TextStyle(
                                    color: Color(0xcc2d1055),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
  getselectedpref()async{

    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      _Selectedlanguage=pref.getString('language');
    });
  }
}
