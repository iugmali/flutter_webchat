import 'package:uuid/uuid.dart';

class Message {
  final String id = const Uuid().v4();
  final String text;
  final String author;
  final DateTime timestamp;

  Message({
    required this.text,
    required this.author,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      text: json['text']!,
      author: json['author']!,
      timestamp: DateTime.parse(json['timestamp']!),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'author': author,
    };
  }
}