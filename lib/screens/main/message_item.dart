import 'package:flutter/material.dart';
import 'package:flutter_webchat/main.dart';
import 'package:flutter_webchat/models/message.dart';
import 'package:flutter_webchat/services/username_store.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageItem extends StatelessWidget {
  final Message message;
  final username = getIt<UsernameStore>().username;

  MessageItem(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: (message.author == username)
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: (message.author == "iugmali-webchat-server")
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(message.text,
                  style: GoogleFonts.jetBrainsMono(
                      fontSize: 12, color: Colors.grey)),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${message.author}:",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold, fontSize: 24),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          message.text,
                          style: GoogleFonts.jetBrainsMono(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                "${message.timestamp.toLocal().day.toString().padLeft(2, '0')}/${message.timestamp.toLocal().month.toString().padLeft(2, '0')}/${message.timestamp.toLocal().year.toString().padLeft(4, '0')} ${message.timestamp.toLocal().hour.toString().padLeft(2, '0')}:${message.timestamp.toLocal().minute.toString().padLeft(2, '0')}:${message.timestamp.toLocal().second.toString().padLeft(2, '0')}",
                                style: GoogleFonts.jetBrainsMono(
                                    fontSize: 12, color: Colors.grey))
                          ],
                        )
                      ]),
                ),
              ),
            ),
    );
  }
}
