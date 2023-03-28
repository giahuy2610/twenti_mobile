import 'package:flutter/material.dart';

import '../../services/chat/chat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  void test() {}

  @override
  void initState() {
    super.initState();
    newChat;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: const [
        Text("hdoiidboidb"),
        IconButton(onPressed: newChat, icon: Icon(Icons.face))
      ])),
    );
  }
}
