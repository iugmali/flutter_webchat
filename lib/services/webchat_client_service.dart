import 'package:flutter_webchat/models/message.dart';
import 'package:flutter_webchat/services/messages_store.dart';
import 'package:socket_io_client/socket_io_client.dart';

class WebchatClientService {
  MessagesStore messagesStore;
  Socket socket = io(
      'https://webchat.iugmali.com',
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .build());

  WebchatClientService(this.messagesStore);

  void connect() {
    socket.connect();
    socket.onConnect((_) {});
    socket.on('message', (data) {
      messagesStore.addMessage(Message.fromJson(data));
    });
    socket.onDisconnect((_) {});
  }
}
