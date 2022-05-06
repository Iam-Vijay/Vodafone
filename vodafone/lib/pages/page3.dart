import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:vodafone/OwnColors.dart';

class page3 extends StatefulWidget {
  late PersistentTabController _controller;

  page3(this._controller );

  @override
  State<page3> createState() => _page3State(this._controller);
}

class _page3State extends State<page3> {
  late PersistentTabController _controller;
   List<MessageList> messagelist = [];
  _page3State(this._controller);
  ScrollController scrollcontroller = new ScrollController();


  @override
  void initState() {
    super.initState();
    setState(() {
      messagelist.add(MessageList("me", "assets/images/chaticons.jpg", "Hiiii Bro"));
      messagelist.add(MessageList("admin", "assets/images/chaticons.jpg", "Hiiii Bro"));
      messagelist.add(MessageList("me", "assets/images/chaticons.jpg", "My Vodofone data is not working Bro"));
      messagelist.add(MessageList("admin", "assets/images/chaticons.jpg", "wait Bro ,I'll Check. "));
      messagelist.add(MessageList("me", "assets/images/chaticons.jpg", "Ok Bro"));


    });
    WidgetsBinding.instance?.addPostFrameCallback( (_) {
      scrollcontroller.jumpTo(scrollcontroller.position.maxScrollExtent);
    });

  }

  @override
  Widget build(BuildContext context) {

    TextEditingController mycontroller = TextEditingController();

    return SafeArea(

        child: SingleChildScrollView(
        child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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

              Text("Chats",style: TextStyle(fontSize: 18,fontFamily: "Ubuntu"),),

              Icon(Icons.notifications_none_outlined,size: 25,)

            ],
          ),

          ListView.builder(shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),controller: scrollcontroller,
             itemBuilder: (BuildContext context,int index
                  ){


                return Mymessage(messagelist[index]);

              },itemCount: messagelist.length,),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color:OwnColors.maincolor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(Icons.add, color: Colors.white, size: 20, ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: TextField(
                            controller: mycontroller,
                            decoration: InputDecoration(
                                hintText: "Write message...",
                                hintStyle: TextStyle(color: Colors.black54),
                                border: InputBorder.none,

                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        FloatingActionButton(
                          onPressed: (){
                            setState(() {
                              if(mycontroller.text.isNotEmpty){
                                messagelist.add(MessageList("me", "", mycontroller.text));
                              }
                            });
                          },
                          child: Icon(Icons.send,color: Colors.white,size: 18,),
                          backgroundColor: OwnColors.maincolor,
                          elevation: 0,
                        ),
                      ],

                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    )


    );


  }
  Widget Mymessage(MessageList messageList)

  {
    return (messageList.from == "me") ? receiver(messageList.message!):sender(messageList.message!);
  }

  Widget sender(String message){
    return ChatBubble(
      clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(top: 20),
      backGroundColor: OwnColors.maincolor,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
  Widget receiver(String message){
    return  ChatBubble(
      clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
      backGroundColor: Color(0xffE7E7ED),
      margin: EdgeInsets.only(top: 20),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class MessageList{
  String? from;
  String? icon;
  String? message;

  MessageList(this.from, this.icon, this.message);
}
