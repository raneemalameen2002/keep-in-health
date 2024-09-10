import 'package:flutter/material.dart';
import 'package:keep_in_health/model/cart_product.dart';
import 'package:keep_in_health/model/get_orders_model.dart';
import 'package:keep_in_health/screens/main.dart';
import 'package:keep_in_health/service/cart_service.dart';
import 'package:keep_in_health/model/order_model.dart';
import 'package:keep_in_health/model/order_product_model.dart';
class ItemMyOrders extends StatelessWidget {
   const ItemMyOrders({super.key, required this.orderProductModel});
   final OrderProductModel orderProductModel;


  @override
  Widget build(BuildContext context) {
     String host='http://127.0.0.1:8000';
  String imageOnly=orderProductModel.image.toString();
  String imageWithHost='$host'+'$imageOnly';
    return FutureBuilder(
      future: getToCart(USER_ID),
      
      builder: (context, status) {
        if(status.hasData) {
          return MaterialButton(
            
                          onPressed: (){
                             
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    // decoration:  BoxDecoration(
                                    //   image: DecorationImage(
                                    //     image: NetworkImage(imageWithHost),
                                    //     fit: BoxFit.cover,
                                    //   ),
                                    // ),
                                  ),
                                  const SizedBox(width: 25,),
                                   Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            orderProductModel.com_name,
                                           
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                            ),
                                            Row(
                                              children: [
                                                Text(orderProductModel.quantity.toString(),
                                       style: TextStyle(
                                         color: Colors.grey[700],
                                       ),),
                                       SizedBox(width: 5,),
                                        Text("pieces",
                                       style: TextStyle(
                                         color: Colors.grey[700],
                                       ),),
                          
                                              ],
                                            ),
                                           
                                        ],
                                      ),
                                    ),
                                  ),
                                   
                          
                                ],
                              ),
                             
                            ],
                          ),
                        );
        }
        else{
          return Center(
              child: CircularProgressIndicator(color: Color(0xff660F56),),
            );
        }
      }
      
    );
  }
}