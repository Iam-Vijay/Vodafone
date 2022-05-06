import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vodafone/OwnColors.dart';

class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  State<page1> createState() => _page1State();
}
//https://images.thequint.com/thequint%2F2021-07%2F63d383be-a581-48a0-95f7-3c5e04fe14ee%2F201452967_346672283741661_3842727334980044498_n_1_.jpg?rect=0%2C0%2C1080%2C608&auto=format%2Ccompress&fmt=webp
class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 5,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset("assets/images/chaticon.jpg",width: 40,height: 40,),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Text("Good Morning",style: TextStyle(fontSize: 12,fontFamily: "Ubuntu",color: Colors.grey),),
                        Text("Vijay",style: TextStyle(fontFamily: "Ubuntu",fontSize: 15),),
                      ],
                    )
                  ],
                ),
                Icon(Icons.notifications_none_outlined,size: 25,)

              ],
            ),
            SizedBox(height: 10,),
            Divider(height: 2,),
            Card(
              child: Container(
                height: 200,
                width: double.infinity,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/vback.jpg'))),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:Column(
                      children: [
                        Text('The Package  of \n Services for the \n tariff is not Valid',style: TextStyle(color: Colors.white,fontSize: 18),),
                        SizedBox(height: 20,),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: ( "To connect ,replenish the \n account by "),
                                style: TextStyle(color: Colors.white,fontFamily: "Ubuntu",fontSize: 12)),
                            TextSpan(
                                text: "250 USD",
                                style: TextStyle( color: Colors.white,
                                    fontWeight: FontWeight.bold,fontFamily: "Ubuntu",fontSize: 16)),

                          ]),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: 100,
                          padding: EdgeInsets.all(2),
                          height: 40,
                          child: ElevatedButton(

                            onPressed: () {

                            },
                            child: Text('Cash In',style: TextStyle(fontFamily: "Ubuntu",color: OwnColors.maincolor),),
                            style:ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )


                ),
              ),
              margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(child: IconandName(Icons.add, "Cash In")),
                  Flexible(child:  IconandName(Icons.miscellaneous_services_outlined, "Service")),
                  Flexible(child:  IconandName(Icons.support, "Support")),
                  Flexible(child:  IconandName(Icons.rotate_right_rounded, "Roaming"))
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Balance",style: TextStyle(fontFamily: "Ubuntu",fontSize: 16,color: Colors.black),),
                  Text("See all",style: TextStyle(fontFamily: "Ubuntu",fontSize: 12,color: OwnColors.maincolor),)
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("180.50 ",style: TextStyle(color: OwnColors.maincolor,fontSize: 25,fontFamily: "Ubunutu",fontWeight: FontWeight.bold),),
                  ],
                )


            ),

            Padding(padding: EdgeInsets.all(5),
              child: Container(
                width: double.infinity,
                height: 200,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  color: OwnColors.maincolor,
                  child: Padding(padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InsideCard(Icons.album_rounded,"", "20.5", "GB",true),
                        InsideCard(Icons.album_rounded,"assets/images/sms.png", "500", "SMS",false),
                        InsideCard(Icons.album_rounded, "assets/images/call.png","100", "Min",false)

                      ],
                    ),

                  ),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
  Widget InsideCard(IconData iconData,String image,String tittle,String size,bool isimage){
    return Container(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isimage ? Icon(iconData,size: 100,color: Colors.white,) : Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: ImageIcon(
              AssetImage(image),
              size: 80,
              color: Colors.white,
            ),
          ),
          Text(tittle,style: TextStyle(color: Colors.white,fontSize: 22,fontFamily: "Ubuntu",fontWeight: FontWeight.bold),),
          Text(size,style: TextStyle(color: Colors.white,fontFamily: "Ubuntu"))
        ],
      ),

    );

  }
  Widget IconandName(IconData icons,String tittle){
    return Container(
      width: 150,
      height: 80,
      child: Card(
        color: Colors.white,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),shadowColor: CupertinoColors.inactiveGray,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icons,size: 30,),
            SizedBox(height: 10,),
            Text(tittle,style: TextStyle(fontFamily: "Ubuntu",fontSize: 15),)
          ],
        ),
      ),
    );
  }
}
