// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessage {
  String? get key;
  String get senderId;
  String? get message;
  bool get seen;
  String? get createdAt;
  int get timeStamp;
  String get senderName;
  String get receiverId;
  @DocumentSnapshotConverter()
  DocumentSnapshot? get documentSnapshot;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatMessage &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.seen, seen) || other.seen == seen) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.documentSnapshot, documentSnapshot) ||
                other.documentSnapshot == documentSnapshot));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, senderId, message, seen,
      createdAt, timeStamp, senderName, receiverId, documentSnapshot);

  @override
  String toString() {
    return 'ChatMessage(key: $key, senderId: $senderId, message: $message, seen: $seen, createdAt: $createdAt, timeStamp: $timeStamp, senderName: $senderName, receiverId: $receiverId, documentSnapshot: $documentSnapshot)';
  }
}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) _then) =
      _$ChatMessageCopyWithImpl;
  @useResult
  $Res call(
      {String? key,
      String senderId,
      String? message,
      bool seen,
      String? createdAt,
      int timeStamp,
      String senderName,
      String receiverId,
      @DocumentSnapshotConverter()
      DocumentSnapshot<Object?>? documentSnapshot});
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res> implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? senderId = null,
    Object? message = freezed,
    Object? seen = null,
    Object? createdAt = freezed,
    Object? timeStamp = null,
    Object? senderName = null,
    Object? receiverId = null,
    Object? documentSnapshot = freezed,
  }) {
    return _then(_self.copyWith(
      key: freezed == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      seen: null == seen
          ? _self.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStamp: null == timeStamp
          ? _self.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      senderName: null == senderName
          ? _self.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _self.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      documentSnapshot: freezed == documentSnapshot
          ? _self.documentSnapshot!
          : documentSnapshot // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChatMessage implements ChatMessage {
  _ChatMessage(
      {this.key,
      required this.senderId,
      this.message,
      this.seen = false,
      this.createdAt,
      required this.timeStamp,
      required this.senderName,
      required this.receiverId,
      @DocumentSnapshotConverter() this.documentSnapshot});
  factory _ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  @override
  final String? key;
  @override
  final String senderId;
  @override
  final String? message;
  @override
  @JsonKey()
  final bool seen;
  @override
  final String? createdAt;
  @override
  final int timeStamp;
  @override
  final String senderName;
  @override
  final String receiverId;
  @override
  @DocumentSnapshotConverter()
  final DocumentSnapshot<Object?>? documentSnapshot;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatMessageCopyWith<_ChatMessage> get copyWith =>
      __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessage &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.seen, seen) || other.seen == seen) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.documentSnapshot, documentSnapshot) ||
                other.documentSnapshot == documentSnapshot));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, senderId, message, seen,
      createdAt, timeStamp, senderName, receiverId, documentSnapshot);

  @override
  String toString() {
    return 'ChatMessage(key: $key, senderId: $senderId, message: $message, seen: $seen, createdAt: $createdAt, timeStamp: $timeStamp, senderName: $senderName, receiverId: $receiverId, documentSnapshot: $documentSnapshot)';
  }
}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(
          _ChatMessage value, $Res Function(_ChatMessage) _then) =
      __$ChatMessageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? key,
      String senderId,
      String? message,
      bool seen,
      String? createdAt,
      int timeStamp,
      String senderName,
      String receiverId,
      @DocumentSnapshotConverter()
      DocumentSnapshot<Object?>? documentSnapshot});
}

/// @nodoc
class __$ChatMessageCopyWithImpl<$Res> implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = freezed,
    Object? senderId = null,
    Object? message = freezed,
    Object? seen = null,
    Object? createdAt = freezed,
    Object? timeStamp = null,
    Object? senderName = null,
    Object? receiverId = null,
    Object? documentSnapshot = freezed,
  }) {
    return _then(_ChatMessage(
      key: freezed == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      seen: null == seen
          ? _self.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStamp: null == timeStamp
          ? _self.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      senderName: null == senderName
          ? _self.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _self.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      documentSnapshot: freezed == documentSnapshot
          ? _self.documentSnapshot
          : documentSnapshot // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
    ));
  }
}

// dart format on
