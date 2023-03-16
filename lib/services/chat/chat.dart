import 'package:kommunicate_flutter/kommunicate_flutter.dart';

void newChat() {
  dynamic conversationObject = {
    'appId':
        '34452e41144b71ffe441eb3404bf749b0', // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
  };

  KommunicateFlutterPlugin.buildConversation(conversationObject)
      .then((clientConversationId) {
    print("Conversation builder success : $clientConversationId");
  }).catchError((error) {
    print("Conversation builder error : $error");
  });
  KommunicateFlutterPlugin.openConversations();
}
