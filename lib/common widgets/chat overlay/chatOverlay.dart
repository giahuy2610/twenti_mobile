import 'package:flutter/material.dart';
import 'package:twenti_mobile/services/chat/chat.dart';

Widget chatOverlay() {
  return const IconButton(
      onPressed: newChat, icon: Icon(Icons.messenger_outline));
}
