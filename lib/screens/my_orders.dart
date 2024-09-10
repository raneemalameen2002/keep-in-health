import 'package:flutter/material.dart';
import 'package:keep_in_health/components/item_my_orders.dart';
import 'package:keep_in_health/model/get_orders_model.dart';
import 'package:keep_in_health/model/order_model.dart';
import 'package:keep_in_health/model/order_product_model.dart';
import 'package:keep_in_health/provider/language.dart';
import 'package:keep_in_health/screens/my._cart.dart';
import 'package:keep_in_health/service/order_service/view_orders.dart';

class MyOrders extends StatefulWidget {
  
   MyOrders({super.key,required this.orderid});
   num orderid;

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  Language _language = Language();
  List<String> _languages  = ['AR' , 'EN' ];
  String ? _Selectedlanguage;
  
  @override
  Widget build(BuildContext context) {
    String status1;
    return Directionality(textDirection:_language.getLanguage()=="AR"?TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
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
                              
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>MyCart() ));
                            },
                            icon: Icon(Icons.arrow_back),
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
                   Expanded(
                      child: FutureBuilder(
                          future: getOrders(widget.orderid),
                          builder: (context, status) {
                            if (status.hasData) {
                              dynamic temp = status.data;
                              List<OrderProductModel> orderProductModelList = List.generate(
                                  temp['data']['Products']
                                      .length, 
                                  (index) => OrderProductModel.fromMap(
                                      temp['data']['Products'][index]));
                              return ListView.separated(
                                  itemCount: orderProductModelList.length,
                                  separatorBuilder: (context, index) => Divider(
                                      indent: 1, color: Colors.grey, height: 5),
                                  itemBuilder: (BuildContextcontext, int index) {
                                    return ItemMyOrders(orderProductModel: orderProductModelList[index],); 
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
                    FutureBuilder(
                      future: getOrders(widget.orderid),
                      builder:  (context, status) {
                        if (status.hasData){
                           dynamic temp = status.data;
                              List<OrderModel> orderModelList = List.generate(
                                  temp['data']['Order']
                                      .length,(index) => OrderModel.fromMap(
                                       temp['data']['Order']));
                                     return Padding(
                                       padding: const EdgeInsets.symmetric(vertical:20.0,horizontal: 15),
                                       child: Column(
                                                           children: [
                                                             Row(
                                                               children: [
                                                                 Text(_language.tordersta()!,style: TextStyle(
                                                                   fontSize: 20,
                                                                   fontWeight: FontWeight.bold,
                                                                   color: Color(0xff660F56),
                                     
                                                                 ),),
                                                                  SizedBox(width: 10,),
                                                                // if(
                                                                //   orderModelList[0].paid== 0
                                                                // ){
                                                                //   status1="InPreparation";
                                                                // }
                                                                // else if(){
    
                                                                // }
                                                                 
                                                                 Text( orderModelList[0].paid== 0 ? status1=_language.timpra()! :orderModelList[0].paid== 1 ? status1=_language.tsend()! :status1=_language.tresev()!,style: TextStyle(
                                                                   fontSize: 20,)),
    
                                                       
                                                               ],
                                                               
                                                             ),
                                                            Row(
                                                              children: [
                                                                Text(_language.tTooalPrice()!,style: TextStyle(
                                                                   fontSize: 20,
                                                                   color: Color(0xff660F56),
                                                                   fontWeight: FontWeight.bold,
                                                                   
                                                                 ),),
                                                                 SizedBox(width: 10,),
                                     
                                                                Text(orderModelList[0].total_price.toString(),style: TextStyle(
                                                                   fontSize: 20,)),
                                                              ],
                                                            ),
                                                       
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
                            }
                      },
                       
                    ),
                  ]
                )
        )
        ),
      ),
    );
  }
}