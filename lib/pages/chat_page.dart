import 'package:bubble/bubble.dart';
import 'package:chatapp/element/custom_profile_appbar.dart';
import 'package:chatapp/pages/detail_profile_page.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomProfileAppBar(
        appBar: AppBar(
          title: Text('Kissuki'),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailProfilePage()));
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              // color: Colors.green,
              child: ListView(
                reverse: true,
                children: [
                  SendMessage(
                    chat: "Hello",
                    clock: "17:02",
                  ),
                  ReceiveMessage(
                    chat: "Hello",
                    clock: "17:02",
                  ),
                  TimeMessage(
                    time: "Today",
                  ),
                  SendMessage(
                    chat: "Hello",
                    clock: "17:02",
                  ),
                  ReceiveMessage(
                    chat: "Hello",
                    clock: "17:02",
                  ),
                  TimeMessage(
                    time: "Yesterday",
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            padding: EdgeInsets.fromLTRB(8, 15, 8, 15),
            child: TextFormField(
              cursorColor: Colors.red,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                contentPadding: EdgeInsets.fromLTRB(18, 5, 8, 5),
                hintText: "Message here...",
                hintStyle: TextStyle(fontSize: 13, color: Colors.grey[500]),
                suffixIcon: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.red,
                    ),
                    onPressed: () {}),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                    borderSide: BorderSide(width: 1, color: Colors.grey[500])),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey[500]),
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeMessage extends StatefulWidget {
  String time;
  TimeMessage({Key key, this.time}) : super(key: key);

  @override
  _TimeMessageState createState() => _TimeMessageState();
}

class _TimeMessageState extends State<TimeMessage> {
  @override
  Widget build(BuildContext context) {
    return Bubble(
      alignment: Alignment.center,
      color: Colors.grey[400],
      child: Text(widget.time,
          textAlign: TextAlign.center, style: TextStyle(fontSize: 11.0)),
    );
  }
}

class ReceiveMessage extends StatefulWidget {
  String chat, clock;

  ReceiveMessage({Key key, this.chat, this.clock}) : super(key: key);

  @override
  _ReceiveMessageState createState() => _ReceiveMessageState();
}

class _ReceiveMessageState extends State<ReceiveMessage> {
  @override
  Widget build(BuildContext context) {
    return Bubble(
      margin: BubbleEdges.fromLTRB(5, 20, 40, 0),
      alignment: Alignment.topLeft,
      color: Colors.grey[200],
      nip: BubbleNip.leftBottom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(widget.chat, style: TextStyle(), textAlign: TextAlign.left),
          SizedBox(
            height: 3,
          ),
          Text(
            widget.clock,
            style: TextStyle(fontSize: 8),
          )
        ],
      ),
    );
  }
}

class SendMessage extends StatefulWidget {
  String chat, clock;

  SendMessage({Key key, this.chat, this.clock}) : super(key: key);

  @override
  _SendMessageState createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  @override
  Widget build(BuildContext context) {
    return Bubble(
      margin: BubbleEdges.fromLTRB(40, 20, 5, 0),
      alignment: Alignment.topRight,
      nip: BubbleNip.rightBottom,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(widget.chat,
              style: TextStyle(color: Colors.grey[100]),
              textAlign: TextAlign.left),
          SizedBox(
            height: 3,
          ),
          Text(
            widget.clock,
            style: TextStyle(color: Colors.white, fontSize: 8),
          )
        ],
      ),
    );
  }
}
