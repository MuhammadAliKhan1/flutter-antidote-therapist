import 'package:antidote/global.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:google_fonts/google_fonts.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Function onSend;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: SafeArea(
            child: AppBar(
              leading: Container(),
              elevation: 1,
              backgroundColor: Colors.white,
              flexibleSpace: Align(
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.blue,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Spacer(),
                    Column(
                      children: <Widget>[
                        AutoSizeText(
                          "Dikhsha Sen",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: <Widget>[
                            Image(
                              image: AppImages.onlineStatus,
                              height: MediaQuery.of(context).size.height / 35,
                              width: MediaQuery.of(context).size.width / 35,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            AutoSizeText(
                              "online",
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          )),
      body: SafeArea(
        child: DashChat(
          scrollToBottom: false,
          onSend: onSend,
          messages: [
            ChatMessage(
              text: "Hello",
              user: ChatUser(
                name: "Fayeed",
                uid: "123456789",
                avatar:
                    "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
              ),
              createdAt: DateTime.now(),
              image: "http://www.sclance.com/images/picture/Picture_753248.jpg",
            ),
            ChatMessage(
              text: "Hello",
              user: ChatUser(
                name: "Fayeed",
                uid: "123456789",
                avatar:
                    "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
              ),
              createdAt: DateTime.now(),
            ),
            ChatMessage(
              text: "Hi",
              user: ChatUser(
                name: "Mustafa",
                uid: "12345999-9-909000990",
                avatar:
                    "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
              ),
              createdAt: DateTime.now(),
            ),
            ChatMessage(
              text: "Hi",
              user: ChatUser(
                name: "Mustafa",
                uid: "123456",
                avatar:
                    "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
              ),
              createdAt: DateTime.now(),
            ),
            ChatMessage(
              id: '2',
              text: "Hi bro",
              user: ChatUser(
                name: "Fayeed",
                uid: "123456789",
                avatar:
                    "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
              ),
              createdAt: DateTime.now(),
            ),
            ChatMessage(
              quickReplies: QuickReplies(
                  values: <Reply>[Reply(title: "hello", value: "Hello")]),
              text: "Hi bro",
              user: ChatUser(
                name: "Fayeed",
                uid: "12345sdds89",
                avatar:
                    "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
              ),
              createdAt: DateTime.now(),
            ),
          ],
          user: ChatUser(
            name: "Jhon Doe",
            uid: "xxxxxxxxx",
            avatar:
                "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
          ),
          dateFormat: DateFormat('yyyy-MMM-dd'),
          timeFormat: DateFormat('HH:mm'),
          alwaysShowSend: false,
          inputContainerStyle: BoxDecoration(
              border: Border.all(width: 1.0, color: AppColors.blue),
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)),
          shouldShowLoadEarlier: false,
          showTraillingBeforeSend: true,
          trailing: <Widget>[
            Container(
              color: Colors.grey,
              child: IconButton(
                icon: Image(image: AppImages.microphone),
                onPressed: null,
              ),
            )
          ],
        
          sendButtonBuilder: (Function click) {
            return IconButton(
              icon: Icon(
                Icons.send,
                size: 40,
              ),
              onPressed: () {},
            );
          },
          leading: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                size: 40,
                color: AppColors.slightGrey,
              ),
              onPressed: () {},
            )
          ],
          inputDecoration: InputDecoration.collapsed(
            hintText: "Add message here...",
          ),
          showUserAvatar: true,
          inputTextStyle: GoogleFonts.roboto(fontSize: 18),
          messageContainerDecoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          inputToolbarMargin: EdgeInsets.only(bottom: 30),
        ),
      ),
    );
  }
}
