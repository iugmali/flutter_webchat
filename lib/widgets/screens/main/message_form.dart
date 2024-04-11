import 'package:flutter/material.dart';
import 'package:flutter_webchat/main.dart';
import 'package:flutter_webchat/services/username_store.dart';
import 'package:flutter_webchat/services/webchat_client_service.dart';

class MessageForm extends StatefulWidget {
  const MessageForm({super.key});

  @override
  State<MessageForm> createState() => _MessageFormState();
}

class _MessageFormState extends State<MessageForm> {
  var socket = getIt<WebchatClientService>().socket;
  var usernameStore = getIt<UsernameStore>();

  final _messageController = TextEditingController();
  late FocusNode messageFocusNode;

  @override
  void initState() {
    super.initState();
    messageFocusNode = FocusNode();
  }

  void _sendMessage() {
    final message = _messageController.text;
    if (message.isNotEmpty) {
      socket.emit('message', {'author': usernameStore.username, 'text': message});
      _messageController.clear();
      messageFocusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: true,
              focusNode: messageFocusNode,
              controller: _messageController,
              onSubmitted: (_) {
                _sendMessage();
              },
              decoration: const InputDecoration(
                hintText: "Digite sua mensagem",
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
          )
        ],
      ),
    );
  }
}
