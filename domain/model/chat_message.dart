
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
abstract class ChatMessage with _$ChatMessage {
  factory ChatMessage({
    String? key,
    required String senderId,
    String? message,
    @Default(false) bool seen,
    String? createdAt,
    required int timeStamp,
    required String senderName,
    required String receiverId,
    @DocumentSnapshotConverter() DocumentSnapshot? documentSnapshot,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, Object?> json) =>
      _$ChatMessageFromJson(json);

  factory ChatMessage.empty() => ChatMessage(
        key: null,
        senderId: '',
        message: null,
        seen: false,
        createdAt: null,
        timeStamp:
            DateTime.now().toUtc().millisecondsSinceEpoch, // Store as int
        senderName: '',
        receiverId: '',
        documentSnapshot: null,
      );
}

List<ChatMessage> generateDummyChatMessages(int count) {
  return List.generate(count, (index) {
    return ChatMessage(
      key: 'key_$index',
      senderId: 'user_${index % 3}', // Simulates 3 different senders
      message: index.isEven ? "Hello! This is message $index" : null,
      seen: index % 2 == 0,
      createdAt:
          DateTime.now().subtract(Duration(minutes: index)).toIso8601String(),
      timeStamp: DateTime.now().toUtc().millisecondsSinceEpoch, // Store as int
      senderName: 'Sender ${index % 3}',
      receiverId: 'user_${(index + 1) % 3}', // Simulates 3 different receivers
    );
  });
}

class DocumentSnapshotConverter
    implements JsonConverter<DocumentSnapshot, Map<String, dynamic>> {
  const DocumentSnapshotConverter();

  @override
  DocumentSnapshot fromJson(Map<String, dynamic> json) {
    // Not used in this case, as we're converting from DocumentSnapshot to JSON
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(DocumentSnapshot documentSnapshot) {
    return documentSnapshot.data() as Map<String, dynamic>;
  }
}
