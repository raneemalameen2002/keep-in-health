import 'package:flutter/material.dart';
import 'package:keep_in_health/components/Item_search_category.dart';
import 'package:keep_in_health/components/item_listview.dart';
import 'package:keep_in_health/model/category_model.dart';
import 'package:keep_in_health/model/product_by_category.dart';
import 'package:keep_in_health/provider/language.dart';
import 'package:keep_in_health/screens/main.dart';
import 'package:keep_in_health/service/category_service/category_service.dart';
import 'package:keep_in_health/service/search/search_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Language _language = Language();
  List<String> _languages  = ['AR' , 'EN' ];
  String ? _Selectedlanguage;
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
  
    String label = '0';
    return DefaultTabController(
      length: 2,
      child: Directionality(textDirection:_language.getLanguage()=="AR"?TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
            body: Container(
               decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
              child: Column(
                    children: [
              //#B1A0D8
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(
                      Icons.arrow_back,
                      color: Color(0xcc2d1055),
                      )),
                  ],
                ),
              ),
              //  SizedBox(
              //     height: 20,
              //   ),
              TabBar(
              //  dividerColor: Color(0xcc2d1055),
                 indicatorColor: Color(0xcc2d1055),
                labelColor:Color(0xcc2d1055),
                tabs: [
                Tab(
                  text: _language.tmidicen(),
                ),
                Tab(
                  text: _language.tgatog(),
                )
              ]),
              SizedBox(height: 20,),
              Expanded(
                child: TabBarView(children: [
                  Scaffold(
                    body: StatefulBuilder(builder: (context, setstate) {
                      return Container(
                         decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
                        child: Column(
                          children: [
                            Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: TextField(
                         onChanged: (value) {
                                setstate(() {
                                  if (value.isEmpty) {
                                    label = '0';
                                  } else {
                                    label = value;
                                  }
                                });
                              },
                        cursorColor: Color(0xff4F3476),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.10000000149011612),
                          hintText: _language.tsearch(),
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.247),
                          ),
                          prefixIcon: const Icon(Icons.search, color: Colors.black),
                        ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                          
                            FutureBuilder(
                              future: searchMedicine(label),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                   dynamic temp = snapshot.data;
                              List<ProductCategoryFixed> product = List.generate(
                                  temp['data'][0].length,
                                  (index) =>
                                      ProductCategoryFixed.fromMap(temp['data'][0][index]));
                                      
                              return Expanded(
                                child: ListView.builder(
                                  //مشان يكون في فاصل بين العناصر
                                  itemCount: product.length,
                                  //  separatorBuilder: (context, index) => Divider(
                                  //   color: Color.fromARGB(0, 0, 0, 0).withOpacity(0.10000000149011612),
                                  //  ),
                                  itemBuilder: (context, index) {
                                    return ItemListViewHomeFixed(
                                      productModel: product[index],
                                    );
                                  },
                                ),
                              );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                  Scaffold(
                    body: StatefulBuilder(builder: (context, setstate) {
                      return Container(
                         decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
                        child: Column(
                          children: [
                            Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: TextField(
                         onChanged: (value) {
                                setstate(() {
                                  if (value.isEmpty) {
                                    label = '0';
                                  } else {
                                    label = value;
                                  }
                                });
                              },
                        cursorColor: Color(0xff4F3476),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.10000000149011612),
                          hintText: _language.tsearch(),
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.247),
                          ),
                          prefixIcon: const Icon(Icons.search, color: Colors.black),
                        ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                          
                            FutureBuilder(
                              future: searchCategory(label),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                   dynamic temp = snapshot.data;
                              List<CategoryModel> category= List.generate(
                                  temp['data']['Categories'].length,
                                  (index) =>
                                      CategoryModel.fromMap(temp['data']['Categories'][index]));
                                      
                              return Expanded(
                                child: ListView.builder(
                                  //مشان يكون في فاصل بين العناصر
                                  itemCount: category.length,
                                  //  separatorBuilder: (context, index) => Divider(
                                  //   color: Color.fromARGB(0, 0, 0, 0).withOpacity(0.10000000149011612),
                                  //  ),
                                  itemBuilder: (context, index) {
                                    return ItemSearchCategory(
                                      categoryModelobj: category[index],
                                    );
                                  },
                                ),
                              );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            )
                          ],
                        ),
                      );
                    }),
                  ),
      
      
      
      
                  // Scaffold(
          //           body: FutureBuilder(
          //             future: getCategory(),
          //             builder: (context, snapshot) {
          //               if (snapshot.hasData) {
          //                 // ? searching
          //                 List<CategoryModel> result = [];
          //                 dynamic temp = snapshot.data;
          //                 print(temp);
          //                 List<CategoryModel> category = List.generate(
          //                     temp['data']['Categories'].length,
          //                     (index) => CategoryModel.fromMap(
          //                         temp['data']['Categories'][index]));
          //                 return StatefulBuilder(builder: (context, setstate) {
          //                   return Container(
          //                      decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/background.png'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          //                     child: Column(
          //                       children: [
          //                         Container(
          //                               padding: const EdgeInsets.symmetric(horizontal: 20),
          //                               child: TextField(
          //                onChanged: (value) {
          //                             result.clear();
          //                             setstate(() {
          //                               category.forEach((element) {
          //                                 if (element.name_en.contains(value)) {
          //                                   result.add(element);
          //                                 }
          //                               });
          //                             });
          //                           },
          //               cursorColor: Color(0xff4F3476),
          //               decoration: InputDecoration(
          //                 contentPadding: const EdgeInsets.symmetric(vertical: 20),
          //                 border: OutlineInputBorder(
          //                   borderRadius: BorderRadius.circular(20),
          //                   borderSide: BorderSide.none,
          //                 ),
          //                 filled: true,
          //                 fillColor: Colors.black.withOpacity(0.10000000149011612),
          //                 hintText: 'search',
          //                 hintStyle: TextStyle(
          //                   color: Color.fromRGBO(0, 0, 0, 0.247),
          //                 ),
          //                 prefixIcon: const Icon(Icons.search, color: Colors.black),
          //               ),
          //                               ),
          //                             ),
                                
          //                         SizedBox(
          //                             height: 500,
          //                             child: ListView.builder(
          //                               itemCount: result.length,
          //                               itemBuilder: (context, index) => ListTile(
          //                                 title: Text(result[index].name_en),
          //                               ),
          //                             ))
          //                       ],
          //                     ),
          //                   );
          //                 });
          //               } else {
          //                 return Column(
          //                   children: [
          //                     CircularProgressIndicator(),
          //                   ],
          //                 );
          //               }
          //             },
          //           ),
                  // )
                ]),
              )
                    ],
                  ),
            )),
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
