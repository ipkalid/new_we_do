import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:we_do/temp/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChattingPage extends StatefulWidget {
  final String serviceID;

  const ChattingPage({@required this.serviceID});

  @override
  _ChattingPageState createState() => _ChattingPageState(serviceID: serviceID);
}

class _ChattingPageState extends State<ChattingPage> {
//------------------------------------------------------------------------------
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }
//------------------------------------------------------------------------------------

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String message = "Hello from app";
  final String serviceID;

  _ChattingPageState({this.serviceID});

  @override
  Widget build(BuildContext context) {
    Box<String> currentUser;
    currentUser = Hive.box<String>("currentUser");
    String userPhoneNumber = currentUser.get("phoneNumber");
    String collectionName = "$serviceID";

    if (_error) {
      return Text("Error");
    }
    if (!_initialized) {
      return Text("Loading");
    }
    return Scaffold(
      appBar: AppBar(title: Text("Order")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: firestore
                    .collection(collectionName)
                    .orderBy("time")
                    .snapshots(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final messages = snapshot.data.docs.reversed;
                    List<MessageBubble> messagesWidget = [];
                    for (var message in messages) {
                      final messageText = message.data()['text'];
                      final messageSender = message.data()['sender'];
                      messagesWidget.add(MessageBubble(
                        text: "$messageText",
                        isMe: userPhoneNumber == messageSender,
                      ));
                    }
                    return Expanded(
                      child: ListView(
                        reverse: true,
                        children: messagesWidget,
                      ),
                    );
                  } else {
                    return Text("Loading");
                  }
                }),
            Row(
              children: <Widget>[
                Expanded(
                    flex: 6,
                    child: TextField(
                      onChanged: (value) {
                        message = value;
                      },
                      cursorColor: cursorColor,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 1, horizontal: 7),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: activeBorderColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(60))),
                        hintText: "Type a message",
                        hintStyle: TextStyle(
                          fontSize: 0.045 * displayWidth(context),
                          fontWeight: FontWeight.w500,
                          color: hintTextColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: fieldBorderColor),
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                        ),
                        filled: true,
                        fillColor: fieldColor,
                      ),
                    )),
                Expanded(
                  child: MaterialButton(
                    color: mainOrange,
                    elevation: 2.0,
                    padding: EdgeInsets.all(10.0),
                    shape: CircleBorder(),
                    onPressed: () {
                      Firebase.initializeApp();
                      DateTime now = DateTime.now();
                      firestore.collection(collectionName).add({
                        'text': message,
                        'sender': userPhoneNumber,
                        'time': now.hour.toString() +
                            ":" +
                            now.minute.toString() +
                            ":" +
                            now.second.toString() +
                            ":" +
                            now.microsecond.toString(),
                      });
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 0.05 * displayWidth(context),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const MessageBubble({@required this.text, @required this.isMe});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
            elevation: 5,
            color: isMe ? mainOrange : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 0.04 * displayWidth(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
