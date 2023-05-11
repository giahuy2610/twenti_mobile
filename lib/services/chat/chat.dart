import 'package:kommunicate_flutter/kommunicate_flutter.dart';

void newChat() {
  print("opening chat api");
  dynamic conversationObject = {
    'appId':
        '146a699b0210be3298a047df7d4a822c0', // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
  };

  KommunicateFlutterPlugin.buildConversation(conversationObject)
      .then((clientConversationId) {
    print("Conversation builder success : $clientConversationId");
  }).catchError((error) {
    print("Conversation builder error : $error");
  });
  KommunicateFlutterPlugin.openConversations();
}
