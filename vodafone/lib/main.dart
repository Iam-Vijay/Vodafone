import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vodafone/OwnColors.dart';
import 'package:vodafone/SpinnerClass.dart';
import 'package:vodafone/api_utils.dart';
import 'package:vodafone/phoneverfifcationpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
 class SpinnerItems{

   String? image;
   String? name;

   SpinnerItems(this.image, this.name);
}
class _MyHomePageState extends State<MyHomePage> {
String dropdownValue = "";
List<SpinnerClass>? items = [];
api_utils apiutils = api_utils();
SpinnerClass? countries;

@override
  void initState() {
  super.initState();

 apiutils.fetchPosts().then((List<SpinnerClass> spinner){
   setState(() {
     items = [];
     items = spinner;
     print(items?.length);
   });
 }
  );


}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: LoginPage(),
      ),
    );
  }
  Widget LoginPage(){
    return Container(

        child: SafeArea(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome to My Vodafone",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22,fontFamily:"Ubuntu" ),),
                  SizedBox(width: 15,),
                  Image.asset("assets/images/vodafone.png",width: 30,height: 30,)
                ],
              ),

              Container(padding: EdgeInsets.fromLTRB(30, 10, 40, 0) ,child: Center(child: Text("Monitor your Lifecell account status anywhere and any devices .",style: TextStyle(color: Colors.grey,fontFamily: "Ubuntu",fontSize: 15),textAlign: TextAlign.center,))),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 160,

                padding: EdgeInsets.all(15),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Dropdown(),
                        Divider( height: 0.1,),
                        TextFormField(
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding:
                              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              hintText: "Phone Number"),
                        ),


                      ],
                    ),

                  ),
                ),
              SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: ( "By clicking on "'"Continue"'" you are agreeing \n to our "),
                      style: TextStyle(color: Colors.black87,fontFamily: "Ubuntu")),
                  TextSpan(
                      text: "terms of use",
                      style: TextStyle( color: Colors.red,
                          fontWeight: FontWeight.bold,decoration: TextDecoration.underline,fontFamily: "Ubuntu")),

                ]),
              ),

              SizedBox(height: 20),

              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                height: 80,
                child: ElevatedButton(

                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const phoneverfifcationpage()),
                    );
                  },
                  child: Text('Continue',style: TextStyle(fontFamily: "Ubuntu"),),
                  style:ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(OwnColors.maincolor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
              )
            ],

      ),
        ),
    );
  }

  Widget Dropdown(){
    return DropdownButtonHideUnderline(
        child:
        DropdownButton(
          isExpanded: true,

          hint: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width  - 80,
            child:Row(
              children: [
                Spacer(),
                Text("Select Item",style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: "Ubuntu"),overflow: TextOverflow.ellipsis,maxLines: 2,),
                Spacer(flex: 10,)
              ],
            )

                 ),
          items: items!
              .map((value) => DropdownMenuItem(
            child: Container(
              width: MediaQuery.of(context).size.width  - 80,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SvgPicture.network(value.image!,width: 40,height: 40),
                      Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),child:
                      Text(value.name!,style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: "Ubuntu"),overflow: TextOverflow.ellipsis,maxLines: 2,),
                      ),

                    ],
                  ),
                ),

            ),
            value: value,
          ))
              .toList(),
          value: countries,
          icon: Visibility (visible:true, child: Icon(Icons.arrow_drop_down)),
          onChanged: (SpinnerClass? value) {
            setState(() {
              countries = value!;
              print(value.name);
            });
          },
        )
    );
  }
}
