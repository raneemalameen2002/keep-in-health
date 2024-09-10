import 'package:flutter/material.dart';
import 'package:keep_in_health/model/Medicines.dart';
import 'package:keep_in_health/model/detailsProduct.dart';
import 'package:keep_in_health/model/product_by_category.dart';
import 'package:keep_in_health/model/product_model.dart';
import 'package:keep_in_health/screens/medi_details.dart';
import 'package:keep_in_health/service/favo/add_to_fav.dart';
import 'package:keep_in_health/service/product_services.dart/product_service.dart';

class ItemListViewHome extends StatefulWidget {
  const ItemListViewHome({super.key, required this.productModel});
  final ProductCategory productModel;

  @override
  State<ItemListViewHome> createState() => _ItemListViewHomeState();
}

class _ItemListViewHomeState extends State<ItemListViewHome> {
  
  late DetailsProduct details ;
  bool _isPressed = false;

@override
  void initState() {
    details = DetailsProduct(com_name: widget.productModel.com_name, sci_name: widget.productModel.sci_name, quantity: widget.productModel.quantity, expiration_date: widget.productModel.expiration_date, manufacturer: widget.productModel.manufacturer, image: widget.productModel.image, id: widget.productModel.id, price: widget.productModel.price);
  }
  
  @override
  Widget build(BuildContext context) {
    
    String host='http://127.0.0.1:8000';
  String imageOnly=widget.productModel.image.toString();
  String imageWithHost='$host'+'$imageOnly';
    return FutureBuilder(
        future: getProduct(),
        builder: (context, status) {
          
          if (status.hasData) {
            return Column(
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MediDetails(detailsProduct:details,)));
                    
                  },
                  child: FittedBox(
                    child: Container(
                      height: 168,
                      // width:345,
                      // margin: const EdgeInsets.symmetric(horizontal:35),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(0.10000000149011612),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                        // Image.network(imageWithHost,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  
                                widget.productModel.com_name,),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      style: const TextStyle(
                                          color: Color(0xff4F3476),
                                          fontSize: 15),
                                      
                                widget.productModel.sci_name,
                                      maxLines:
                                          2, ////////////////////////هون بدي اسال سؤال
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Text(
                                widget.productModel.manufacturer,
                                style: const TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  fontFamily: 'Inspiration',
                                  shadows: [
                                    Shadow(
                                      color: Color.fromARGB(97, 0, 0, 0),
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 3.0,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            
                            children: [
                              IconButton(
                                 onPressed: ()async{
                                     bool state= await addToFav(widget.productModel.id);
                                       if(state){
                                         print('object');
                                        }
                                    setState(
                                      () {
                              _isPressed = !_isPressed;
                            },
                          );
                        },
                                icon:Icon(Icons.favorite) ,
                                color: _isPressed?Colors.red:Colors.white,
                              ),
                             Spacer(flex: 1,)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: Color(0xff660F56),),
            );
          }
        });
  }
}



class ItemListViewHomeFixed extends StatelessWidget {
  const ItemListViewHomeFixed({super.key, required this.productModel});
  final ProductCategoryFixed productModel;
  
  @override
  Widget build(BuildContext context) {
     String host='http://127.0.0.1:8000';
  String imageOnly=productModel.image.toString();
  String imageWithHost='$host'+'$imageOnly';
    return FutureBuilder(
        future: getProduct(),
        builder: (context, status) {
          if (status.hasData) {
            return Column(
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: FittedBox(
                    child: Container(
                      height: 168,
                      // width:345,
                      // margin: const EdgeInsets.symmetric(horizontal:35),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(0.10000000149011612),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                        // Image.network(imageWithHost,),
                          Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                           mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 30,),
                              Text(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  
                                productModel.com_name_en,),
                              Text(
                                style: const TextStyle(
                                    color: Color(0xff4F3476),
                                    fontSize: 15),
                                
                              productModel.price.toString(),
                                maxLines:
                                    2, ////////////////////////هون بدي اسال سؤال
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              // Text(
                              //   productModel.com_name_en,
                              //   style: const TextStyle(
                              //     //fontWeight: FontWeight.bold,
                              //     fontSize: 25,
                              //     fontFamily: 'Inspiration',
                              //     shadows: [
                              //       Shadow(
                              //         color: Color.fromARGB(97, 0, 0, 0),
                              //         offset: Offset(2.0, 2.0),
                              //         blurRadius: 3.0,
                              //       ),
                              //     ],
                              //   ),
                              //)
                            ],
                          ),
                         
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: Color(0xff660F56),),
            );
          }
        });
  }
}

