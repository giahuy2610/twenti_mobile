import 'package:kommunicate_flutter/kommunicate_flutter.dart';

void newChat() {
  print("opening chat api");
  dynamic conversationObject = {
    'appId':
        '337cefa9c73e9fd53d6486986a4ad0b9b', // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
    'isSingleConversation': true,
    'conversationTitle': 'Chăm sóc khách hàng'
  };

  KommunicateFlutterPlugin.buildConversation(conversationObject)
      .then((clientConversationId) {
    print("Conversation builder success : $clientConversationId");
  }).catchError((error) {
    print("Conversation builder error : $error");
  });
  KommunicateFlutterPlugin.openConversations();
}
