import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_domain.freezed.dart';
part 'chat_message_domain.g.dart';

@freezed
abstract class ChatMessageDomain with _$ChatMessageDomain {
  factory ChatMessageDomain({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "customer_id") int? userId,
    // @JsonKey(name: "chatable_type") String? chatableType,
    // @JsonKey(name: "chatable_id") int? chatableId,
    @JsonKey(name: "content") String? content,
    // @JsonKey(name: "customer_chat_id") int? customerChatId,
    @JsonKey(name: "batch_id") int? batchId,
    @JsonKey(name: "files") List<String>? fileUrls,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
    @JsonKey(name: "user") ChatUserDomain? user,
    @JsonKey(name: "parent") ChatMessageDomain? parent,
    @Default(false) bool isReply,
    @JsonKey(name: "file_names") List<String>? filesNames,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @DocumentSnapshotConverter()
    DocumentSnapshot? documentSnapshot,
  }) = _ChatMessageDomain;

  factory ChatMessageDomain.fromJson(Map<String, Object?> json) =>
      _$ChatMessageDomainFromJson(json);

  /// Call this factory with the current time in ISO8601 string format.
  factory ChatMessageDomain.empty({required DateTime messageDateTime}) =>
      ChatMessageDomain(
        id: "",
        content: null,
        batchId: null,
        fileUrls: null,
        createdAt: messageDateTime,
        updatedAt: messageDateTime,
        user: null,
        parent: null,
        isReply: false,
        filesNames: null,
        documentSnapshot: null,
      );
}

@freezed
abstract class ChatUserDomain with _$ChatUserDomain {
  factory ChatUserDomain({
    int? id,
    String? name,
    String? role,
    @JsonKey(name: "profile_picture") String? profilePicture,
  }) = _ChatUserDomain;

  factory ChatUserDomain.fromJson(Map<String, Object?> json) =>
      _$ChatUserDomainFromJson(json);
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

class TimestampConverter implements JsonConverter<Timestamp, dynamic> {
  const TimestampConverter();

  @override
  Timestamp fromJson(dynamic json) {
    print(json);
    if (json == null) return Timestamp.now();
    if (json is Timestamp) return json;
    if (json is Map && json['_seconds'] is int) {
      return Timestamp.fromMillisecondsSinceEpoch(json['_seconds'] * 1000);
    }
    throw Exception('Invalid timestamp format');
  }

  @override
  dynamic toJson(Timestamp timestamp) => timestamp;
}
