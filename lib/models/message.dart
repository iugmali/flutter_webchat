import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'message.g.dart';

@HiveType(typeId: 1)
class Message {
  Message({
    required this.author,
    required this.text,
    required this.timestamp,
  });

  @HiveField(0)
  final String _id = const Uuid().v4();

  @HiveField(1)
  final String author;

  @HiveField(2)
  final String text;

  @HiveField(3)
  final DateTime timestamp;

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

  String get id => _id;
}