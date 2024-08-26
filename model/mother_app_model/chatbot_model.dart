// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatBote {
  final String answer;
  ChatBote({
    required this.answer,
  });

  ChatBote copyWith({
    String? answer,
  }) {
    return ChatBote(
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'answer': answer,
    };
  }

  factory ChatBote.fromMap(Map<String, dynamic> map) {
    return ChatBote(
      answer: map['answer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatBote.fromJson(String source) => ChatBote.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChatBote(answer: $answer)';

  @override
  bool operator ==(covariant ChatBote other) {
    if (identical(this, other)) return true;
  
    return 
      other.answer == answer;
  }

  @override
  int get hashCode => answer.hashCode;
}
