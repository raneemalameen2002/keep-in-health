import 'package:flutter/material.dart';
import 'package:keep_in_health/screens/main.dart';
import 'package:keep_in_health/provider/language.dart';
import 'package:keep_in_health/screens/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


class langscreen extends StatefulWidget {


  @override
  State<langscreen> createState() => _langscreenState();

}

class _langscreenState extends State<langscreen> {


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

    return  MaterialApp(home: Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(top: 90.0),
        child: Container(
            color: Colors.white,
            width:  double.infinity,
            height: 200,
            child:Card(color: Colors.red,
              child: Center(
                child: Column(children: [
                  Center(
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

                              language = newvalue;
                              setState(() {
                                _Selectedlanguage = newvalue!;
                              });
                            },items: _languages.map((lang){
                          return DropdownMenuItem(child: new Text(lang) ,
                            value: lang,);}).toList())

                    ),
                  ),

                ] ),
              ),
            )

        ),
      ),
    )  ,


    );

  }


  getselectedpref()async{

    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      _Selectedlanguage=pref.getString('language');
    });
  }

}
