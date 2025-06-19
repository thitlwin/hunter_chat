// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
      key: json['key'] as String?,
      senderId: json['senderId'] as String,
      message: json['message'] as String?,
      seen: json['seen'] as bool? ?? false,
      createdAt: json['createdAt'] as String?,
      timeStamp: (json['timeStamp'] as num).toInt(),
      senderName: json['senderName'] as String,
      receiverId: json['receiverId'] as String,
      documentSnapshot: _$JsonConverterFromJson<Map<String, dynamic>,
              DocumentSnapshot<Object?>>(
          json['documentSnapshot'], const DocumentSnapshotConverter().fromJson),
    );

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'key': instance.key,
      'senderId': instance.senderId,
      'message': instance.message,
      'seen': instance.seen,
      'createdAt': instance.createdAt,
      'timeStamp': instance.timeStamp,
      'senderName': instance.senderName,
      'receiverId': instance.receiverId,
      'documentSnapshot': _$JsonConverterToJson<Map<String, dynamic>,
              DocumentSnapshot<Object?>>(
          instance.documentSnapshot, const DocumentSnapshotConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
