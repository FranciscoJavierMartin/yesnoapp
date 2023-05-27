import 'package:flutter/material.dart';
import 'package:yesnoapp/config/helpers/get_yes_no_answer.dart';
import 'package:yesnoapp/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'Hello world', fromWho: FromWho.me),
    Message(text: 'Are you ready?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isNotEmpty) {
      final newMessage = Message(text: text, fromWho: FromWho.me);
      messages.add(newMessage);

      if (text.endsWith('?')) {
        await otherReply();
      }

      notifyListeners();
      moveScrollToBottom();
    }
  }

  Future<void> otherReply() async {
    final otherMessage = await getYesNoAnswer.getAnswer();
    messages.add(otherMessage);
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
