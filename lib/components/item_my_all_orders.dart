import 'package:flutter/material.dart';
import 'package:keep_in_health/model/get_all_orders_model.dart';
import 'package:keep_in_health/screens/my_orders.dart';

class Item extends StatefulWidget {
    Item({super.key,required this.getAllOrdersModelobj});
GetAllOrdersModel getAllOrdersModelobj;
  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 45,right: 25,top: 15,bottom: 15),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order Number:',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black
              ),),
              Text("OrderDate",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xff676076),
              ),),
            
      Text(
        widget.getAllOrdersModelobj.ordered_at,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(0xff676076),
        ),
      ),
            ],
          ),
           const Spacer(
            flex: 3,
          ),
          Text(widget.getAllOrdersModelobj.id.toString(),
          style: const TextStyle(
            fontSize: 20,
            //fontFamily: 'Inspiration',
            color: Colors.black,
             shadows: [
      Shadow(
        color: Colors.grey,
        offset: Offset(2, 2),
        blurRadius: 3,
      ),
    ],
          ),),
           const Spacer(
            flex: 5,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             

            ],
          ),
         Spacer(flex: 1,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              minimumSize: Size(50, 50),
            backgroundColor: Color(0xff4F3476),
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrders(orderid: widget.getAllOrdersModelobj.id) ));
      //          showDialog(///////////////////////////////////////ليكو
      // context: context,
      // builder: (BuildContext context,) {
      // return ViewOrder();//////////////////هي بدها تزبيط
      // }
      //          );
            },
           child: Text("View"), 
            //icon: Icon(Icons.remove_red_eye),

           )

        ],
      ),
    );
  }
}