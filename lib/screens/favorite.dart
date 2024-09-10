import 'package:flutter/material.dart';
import 'package:keep_in_health/model/favourite_model.dart';
import 'package:keep_in_health/provider/language.dart';
import 'package:keep_in_health/screens/home_page.dart';
import 'package:keep_in_health/screens/main.dart';
import 'package:keep_in_health/screens/my._cart.dart';
import 'package:keep_in_health/service/favo/delete_from_fav.dart';
import 'package:keep_in_health/service/favourite_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:hussam/Home.dart';
//import 'package:hussam/my%20order.dart';
//import 'package:hussam/sign_up.dart';

class favorat extends StatefulWidget {
  @override
  State<favorat> createState() => _favoratState();
}

class _favoratState extends State<favorat> {
   Language _language = Language();
  List<String> _languages  = ['AR' , 'EN' ];
  String ? _Selectedlanguage;
    getselectedpref()async{

    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      _Selectedlanguage=pref.getString('language');
    });
  }
 

    int currentIndex =0;
  
  @override
  void initState() {

    super.initState();
    getselectedpref();

    setState(()=> _language.getLanguage() );
  }
  
  Widget build(BuildContext context) {
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
                ),
              
            ],
          ),
         
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0,bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 45,),
                Row(
                  children: [
                    Builder(
                      builder: (context) {
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
                      }
                    ),
                   Spacer(
                    flex: 1,
                  ),
                    Text(
                        _language.tfavorit()!,
                      style: TextStyle(fontSize: 25),
                    ),
                  Spacer(
                    flex: 1,
                  ),
                    Image.asset("assets/MyMedi logo front-end copy 1 (1).png",height: 50,)
                  ],
                ),
                SizedBox(height: 30,),
                Expanded(
    
                      child: FutureBuilder(
                        future: getToFavourite(),
                        builder: (context, status) {
                          if(status.hasData){
                            dynamic temp = status.data;
                          List<FavouriteModel> favouritelist = List.generate(
                              temp['data'][0].length,
                              (index) =>
                                  FavouriteModel.fromMap(temp['data'][0][index]));
                            return  ListView.separated(
                          
                          itemCount: favouritelist.length ,
                          separatorBuilder:(context, index) => Divider(indent: 1,color: Colors.grey,height:5),
                          itemBuilder:(BuildContextcontext,int index){
                            return ItemMyFavourite(favouriteobj: favouritelist[index],);
                          }
                         
                        );
                          }
                           else {
                          return Center(
                            child: CircularProgressIndicator(color: Color(0xff660F56),),
                          );
                        }
                        }
                       
                      ),
                    ),
                // Center(
                //   child: Container(
                //     height: 70,
                //     width: 360,
                //     child: TextFormField(
                //         cursorColor: Colors.white24,
                //         //controller: emailController,
                //         onFieldSubmitted: (String value) {
                //           print(value);
                //         },
                //         onChanged: (String value) {
                //           print(value);
                //         },
                       
                //         decoration: InputDecoration(
                //           filled: true,
                //           fillColor: Color.fromRGBO(0, 0, 0, 0.1) ,
                //           hintText: 'search',
                //           hintStyle: TextStyle(color: Colors.white54,),
                //           enabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //                 color: Colors.white24),
                //             borderRadius: BorderRadius.circular(10.0),
                //           ),
                //           focusedBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //                 color: Colors.white24),
                //           ),
                //         ),
                //       ),
                //   ),
                // ),
                SizedBox(height: 15,),
                
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        child: Column(
                          children: [
                            Icon(Icons.home_outlined,size: 35,),
                            Text(_language.tHome()!)
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyCart()),
                          );
                        },
                        child: Column(
                          children: [
                            Icon(Icons.shopping_cart,size: 35,),
                            Text(_language.tmyorder()!)
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed:(){
    
                        } ,
                        child: Column(
                          children: [
                            Icon(Icons.favorite,size: 35,color: Color(0xcc2d1055),),
                            Text(_language.tfavorit()!,
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
            )
          )
        ),
    
      ),
    );
  }
}
class ItemMyFavourite extends StatefulWidget {
  ItemMyFavourite({super.key, required this.favouriteobj});
  FavouriteModel favouriteobj;

  @override
  State<ItemMyFavourite> createState() => _ItemMyFavouriteState();
}

class _ItemMyFavouriteState extends State<ItemMyFavourite> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
     String host='http://127.0.0.1:8000';
  String imageOnly=widget.favouriteobj.image.toString();
  String imageWithHost='$host'+'$imageOnly';
    return FutureBuilder(
        future: getToFavourite(),
        builder: (context, status) {
          if (status.hasData) {
            return MaterialButton(
              onPressed: () {},
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            //image: AssetImage('assets/BoneAid.png'),
                            image: NetworkImage(
                                imageWithHost),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          //child: Text('BoneAid',
                          child: Text(
                            widget.favouriteobj.com_name_en,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: IconButton(
                            onPressed:()async{
                              if(await deletFromFav(widget.favouriteobj.id)){
                              setState(
                              () {
                              },
                            );
                              }
                              
                            },
                            icon:Icon(Icons.favorite,
                                size: 32,
                                color:
                                     Color(0xffBB0000) ),
                          ))
                    ],
                  ),
                  // Divider(indent: 1, color: Colors.grey, height: 5),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Color(0xff660F56),
              ),
            );
          }
        });
  }
 
}
