import 'package:flutter/material.dart';
import 'package:keep_in_health/components/item_my_all_orders.dart';
import 'package:keep_in_health/model/get_all_orders_model.dart';
import 'package:keep_in_health/screens/main.dart';
import 'package:keep_in_health/screens/my._cart.dart';
import 'package:keep_in_health/service/order_service/my_orders_service.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Row(
                      children: [
                        IconButton(onPressed: (){
                           Navigator.pop(
                            context,
                            MaterialPageRoute(builder: (context) => MyCart()),
                          );
                        }, icon: Icon(Icons.arrow_back,
                        color: Color(0xff5B4A87),
                        )),
                      ]),
             SizedBox(
                  height: 40,
                ),
                Text('My Orders',
                style: TextStyle(fontSize: 25),),
                Expanded(child: 
                FutureBuilder(
                  future: getMyOrders(USER_ID),
                  builder: (context,status){
                    if(status.hasData){
                       dynamic temp = status.data;
                              List<GetAllOrdersModel> getAllOrdersModelList = List.generate(
                                  temp['data']['Orders'].length, ///////////////////هون الغلط
                                  (index) => GetAllOrdersModel.fromMap(
                                      temp['data']['Orders'][index]));
                                      return ListView.separated(itemCount: getAllOrdersModelList.length,
                        separatorBuilder: (context, index) => Divider(
                           color: Colors.grey,
                             thickness: 0.5,
                            indent: 45,
                           endIndent: 25,
                          ),
                          itemBuilder: (context, index) {
                       return Item(getAllOrdersModelobj: getAllOrdersModelList[index] );
                       },
                          );
                    }else {
                                      return Center(
                                       child: CircularProgressIndicator(
                                  color: Color(0xff660F56),
                                   
                                ),
    
                              );
                            }
                  }
                  
                 )
                )
                
            ],
          ),
      ),
    );
  }
}