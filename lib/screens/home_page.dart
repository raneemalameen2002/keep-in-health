import 'package:flutter/material.dart';
import 'package:keep_in_health/model/category_model.dart';
import 'package:keep_in_health/model/product_by_category.dart';
import 'package:keep_in_health/model/product_model.dart';
import 'package:keep_in_health/provider/language.dart';
import 'package:keep_in_health/screens/favorite.dart';
import 'package:keep_in_health/components/item_listview.dart';
import 'package:keep_in_health/model/Medicines.dart';
import 'package:keep_in_health/screens/main.dart';
import 'package:keep_in_health/screens/my._cart.dart';
import 'package:keep_in_health/screens/search_page.dart';
import 'package:keep_in_health/service/category_service/category_service.dart';
import 'package:keep_in_health/service/product_services.dart/product_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Language _language = Language();
  List<String> _languages = ['AR', 'EN'];

  String? _Selectedlanguage;

  late int selectedIndex = 0;
  ScrollController _scrollController = ScrollController();
  late Map<String, List> all; //هون اذا حسنتقبل المعلومات من الباك ع شكل ماب

  @override
  void initState() {
    super.initState();
    getselectedpref();

    setState(() => _language.getLanguage());
  }

  Widget build(BuildContext context) {
    if (_language.getLanguage() == "AR") {
      lang = 'ar';
    }
    if (_language.getLanguage() == "EN") {
      lang = 'en';
    }
    return Directionality(
      textDirection: _language.getLanguage() == "AR"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.pink.withOpacity(0.1),
        //   elevation: 0,
        // ),
        drawer: Drawer(
          backgroundColor: Color(0xffB0A4D8),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                _language.tmenu()!,
                style: TextStyle(
                  color: Color(0xff660F56),
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  print('language');
                }, ///////هون منحط العملية يلي رح تصير وقت نكبس
                child: ListTile(
                    title: Text(_language.tlanguage()!),
                    leading: Icon(Icons.language),
                    trailing: DropdownButton(
                        hint: Text('language'),
                        value: _Selectedlanguage,
                        onChanged: (newvalue) async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance(); //
                          pref.setString('language', newvalue!);
                          _language.setLanguage(newvalue);
                          language = newvalue;
                          setState(() {
                            _Selectedlanguage = newvalue!;
                          });
                        },
                        items: _languages.map((lang) {
                          return DropdownMenuItem(
                            child: new Text(lang),
                            value: lang,
                          );
                        }).toList())),
              ),
              GestureDetector(
                onTap: () {
                  print('LogOut');
                }, ///////هون منحط العملية يلي رح تصير وقت نكبس
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: Text(_language.tlogout()!),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image:
                      AssetImage('assets/MyMedi logo front-end copy 1 (1).png'),
                  fit: BoxFit.cover,
                )),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 45,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
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
                    Column(
                      children: [
                        Text(
                          _language.twelcomuser()!,
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
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
              ),
              SizedBox(
                height: 12,
              ),
              //Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(),));
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
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
                    prefixIcon: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchPage(),
                              ));
                        },
                        icon: Icon(Icons.search),
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: getCategory(),
                  builder: (context, status) {
                    if (status.hasData) {
                      dynamic temp = status.data;
                      List<CategoryModel> category = List.generate(
                          temp['data']['Categories'].length,
                          (index) => CategoryModel.fromMap(
                              temp['data']['Categories'][index]));
                      return Container(
                        height: 50,
                        margin: const EdgeInsets.only(left: 10),
                        child: Expanded(
                          child: ListView.builder(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: category.length,
                              itemBuilder: (context, index) {
                                Color backgroundColor = selectedIndex == index
                                    ? const Color(0xff5B4A87)
                                    : const Color.fromARGB(20, 0, 0, 0);
                                TextStyle textStyle = TextStyle(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                );
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                      //selectedCategory= medCategory[index];
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    //height: 30,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: backgroundColor,
                                    ),
                                    child: Center(
                                      child: Text(category[index].name,
                                          style: textStyle),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      );
                    } else {
                      return Center(
                        child: LinearProgressIndicator(
                          color: Color(0xff660F56),
                        ),
                      );
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  //margin: EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity,

                  child: FutureBuilder(
                      future: getProduct(id: selectedIndex + 1),
                      builder: (context, status) {
                        if (status.hasData) {
                          dynamic temp = status.data;
                          List<ProductCategory> product = List.generate(
                              temp['data'].values.elementAt(1).length,
                              (index) => ProductCategory.fromMap(
                                  temp['data']['products'][index]));

                          return ListView.builder(
                            //مشان يكون في فاصل بين العناصر
                            itemCount: product.length,
                            //  separatorBuilder: (context, index) => Divider(
                            //   color: Color.fromARGB(0, 0, 0, 0).withOpacity(0.10000000149011612),
                            //  ),
                            itemBuilder: (context, index) {
                              return ItemListViewHome(
                                productModel: product[index],
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Color(0xff660F56),
                            ),
                          );
                        }
                      }),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(Icons.home_outlined,
                              size: 35, color: Color(0xcc2d1055)),
                          Text(
                            _language.tHome()!,
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
                          MaterialPageRoute(builder: (context) => MyCart()),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            size: 35,
                          ),
                          Text(
                            _language.tmyorder()!,
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
                          MaterialPageRoute(builder: (context) => favorat()),
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
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  getselectedpref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      _Selectedlanguage = pref.getString('language');
    });
  }
}
