import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vodafone/OwnColors.dart';

class page4 extends StatefulWidget {
  late final PersistentTabController _controller;

  page4(this._controller);

  @override
  State<page4> createState() => _page4State(this._controller);

}

class _page4State extends State<page4> {
  late final PersistentTabController _controller;

  _page4State(this._controller);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50, height: 50,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _controller.index = 0;
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.grey, width: 2)),
                      child: const Center(
                        child: Icon(Icons.arrow_back_ios_sharp, size: 20,
                          color: Colors.grey,),
                      ),
                    ),
                  ),
                ),

                const Text("Profile",
                  style: TextStyle(fontSize: 18, fontFamily: "Ubuntu"),),

                const Icon(Icons.notifications_none_outlined, size: 25,)

              ],
            ),
            Padding(padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
              child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.asset(
                      "assets/images/chaticon.jpg", height: 130,
                      width: 130,
                      fit: BoxFit.fill,),
                  )
              ),
            ),

            const Padding(padding: EdgeInsets.all(10),
              child: Center(
                child: Text("Vijay S",
                  style: TextStyle(fontSize: 20, fontFamily: "Ubuntu"),),
              ),
            ),


            Padding(padding: const EdgeInsets.all(15),
              child: SizedBox(
                width: double.infinity,
                height: 180,
                child: Card(
                  elevation: 10,
                  color: OwnColors.maincolor,
                  shadowColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("You Won 300 points", style: TextStyle(fontSize: 18,
                          fontFamily: "Ubuntu",
                          color: Colors.white),),
                      const SizedBox(height: 15,),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "You have earned 300 points, which you can redeem for a reward",
                          textAlign: TextAlign.center, style: TextStyle(
                            fontFamily: "Ubuntu",
                            fontSize: 14,
                            color: Colors.white),),
                      ),
                      const SizedBox(height: 15,),
                      Container(
                        width: 150,
                        padding: const EdgeInsets.all(2),
                        height: 40,
                        child: ElevatedButton(

                          onPressed: () {
                          },
                          child: Text('Swap Now', style: TextStyle(
                              fontFamily: "Ubuntu",
                              color: OwnColors.maincolor),),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
              ),

            ),

            Padding(padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Icon(Icons.account_circle, size: 30,
                          color: OwnColors.maincolor,),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text("Profile Info", style: TextStyle(
                            fontFamily: "Ubuntu", fontSize: 16),),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Icon(Icons.arrow_forward_ios_rounded,
                      color: OwnColors.maincolor,),
                  )
                ],
              ),

            ),
            Padding(padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Icon(
                          Icons.call, size: 30, color: OwnColors.maincolor,),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text("My Numbers", style: TextStyle(
                            fontFamily: "Ubuntu", fontSize: 16),),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Icon(Icons.arrow_forward_ios_rounded,
                      color: OwnColors.maincolor,),
                  )
                ],
              ),

            ),
            Padding(padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Icon(Icons.settings, size: 30,
                          color: OwnColors.maincolor,),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text("Setting", style: TextStyle(
                            fontFamily: "Ubuntu", fontSize: 16),),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Icon(Icons.arrow_forward_ios_rounded,
                      color: OwnColors.maincolor,),
                  )
                ],
              ),

            ),
            Padding(padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Icon(Icons.support_agent, size: 30,
                          color: OwnColors.maincolor,),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text("Support", style: TextStyle(
                            fontFamily: "Ubuntu", fontSize: 16),),
                      ),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Icon(Icons.arrow_forward_ios_rounded,
                      color: OwnColors.maincolor,),
                  )
                ],
              ),

            ),
          ],
        ),
      ),
    );




  }
}
