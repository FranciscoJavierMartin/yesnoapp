import 'package:flutter/material.dart';
import 'chat_view.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
              padding: EdgeInsets.all(4.0),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/23464945?v=4'))),
          title: const Text('Chat screen'),
          centerTitle: false,
        ),
        body: ChatView());
  }
}
