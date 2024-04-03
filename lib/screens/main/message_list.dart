import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_webchat/main.dart';
import 'package:flutter_webchat/screens/main/message_item.dart';
import 'package:flutter_webchat/services/messages_store.dart';

class MessageList extends StatelessWidget {
  MessageList({super.key});

  var messagesStore = getIt<MessagesStore>();
  final ScrollController _controller = ScrollController();


  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Observer(
      builder: (_) {
        return ListView.builder(
          controller: _controller,
          itemCount: messagesStore.messages.length,
          itemBuilder: (_, index) {
            Timer(const Duration(milliseconds: 100), () => _scrollDown());
            var message = messagesStore.messages[index];
            return MessageItem(message, key: Key(message.id));
          },
        );
      },
    );
  }
}
