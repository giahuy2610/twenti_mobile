import 'package:flutter/cupertino.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  void test() {
    dynamic conversationObject = {
      'appId':
          '<APP_ID>', // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
    };

    KommunicateFlutterPlugin.buildConversation(conversationObject)
        .then((clientConversationId) {
      print(
          "Conversation builder success : " + clientConversationId.toString());
    }).catchError((error) {
      print("Conversation builder error : " + error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
