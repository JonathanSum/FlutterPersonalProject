import 'package:flutter/material.dart';

void main() {
  runApp(new AwsomeChatApp());
}

class AwsomeChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "ChatAppFor02",
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();

  @override
  void _handleSubmitted(String text) {
    _textController.clear();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Zero Two's Chat App")),
      body: _buildTextComposer(),
    );
  }

  Widget _buildTextComposer() {
    return new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(children: <Widget>[
          new Flexible(
              child: new TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: new InputDecoration.collapsed(
                      hintText: "Send a message")
              )
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal:4.0),
            child: new IconButton(
              icon: new Icon(Icons.send),
              onPressed:()=>_handleSubmitted(_textController.text)
            )
          )
        ]
        )
    );
  }
}
