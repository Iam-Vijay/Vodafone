import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../OwnColors.dart';

class page2 extends StatefulWidget {
  late PersistentTabController _controller;

  page2(this._controller );

  @override
  State<page2> createState() {
    return _page2State(this._controller);
  }
}

class _page2State extends State<page2> {
  List<MyMenu> menulist = [];
  late PersistentTabController _controller;

  _page2State(this._controller);


  @override
  void initState() {
    super.initState();


      menulist.add(MyMenu("Expand", Icons.account_circle,false));
      menulist.add(MyMenu("Account Replenishment", Icons.replay_5_outlined,false));
      menulist.add(MyMenu("Recommendations for You", Icons.recommend,false));
      menulist.add(MyMenu("Tariffs", Icons.electrical_services_outlined,false));
      menulist.add(MyMenu("Services", Icons.miscellaneous_services_outlined,false));
      menulist.add(MyMenu("Roaming", Icons.wifi_protected_setup,false));
      menulist.add(MyMenu("Vodafone Bonus", Icons.outbond_outlined,false));
      menulist.add(MyMenu("My Numbers", Icons.call_outlined,false));
      menulist.add(MyMenu("Support", Icons.support,false));


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 50,height: 50,
                child: InkWell(
                  onTap:(){
                    setState(() {
                      _controller.index = 0;
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.grey, width: 2)),
                    child: Center(
                      child: Icon(Icons.arrow_back_ios_sharp,size: 20,color: Colors.grey,),
                    ),
                  ),
                ),
              ),

              Text("Menu",style: TextStyle(fontSize: 18,fontFamily: "Ubuntu"),),

              Icon(Icons.notifications_none_outlined,size: 25,)

            ],
          ),

          Container(
            child: ListView.builder( shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context,int index){

                return MenuUi(menulist[index]);

                },itemCount: menulist.length ,),
          ),
        ],
      ),

    ));
  }
  Widget MenuUi(MyMenu menu){
    return Padding(padding: EdgeInsets.all(30),
      child: Column(
        children :[
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Icon(menu.iconData,size: 30,color: OwnColors.maincolor,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(menu.name!,style: TextStyle(fontFamily: "Ubuntu",fontSize: 16),),
                ),
              ],
            ),

           menu.isclick ?
           Padding(
             padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
             child: InkWell(child: Icon(Icons.arrow_drop_down_circle_outlined,color: OwnColors.maincolor,)
               ,onTap: (){
                 setState(() {
                   menu.isclick = !menu.isclick;
                 });
               },),) :
           Padding(
             padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
             child: InkWell(child: Icon(Icons.arrow_forward_ios_rounded,color: OwnColors.maincolor,)
               ,onTap: (){
                 setState(() {
                   menu.isclick = !menu.isclick;
                 });
               },),
           )
          ],
        ),
          menu.isclick ?
          ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context,int index){
                return ListTile(
                    leading: Icon(Icons.person),
                    trailing: Text("GFG",
                      style: TextStyle(
                          color: Colors.green,fontSize: 15),),
                    title:Text("List item $index")
                );
              }
          ) : const Text("")

    ]  ),

    );
  }
}


class MyMenu{

  String? name;
  IconData? iconData;
  bool isclick = false;

  MyMenu( this.name,this.iconData,this.isclick);
}