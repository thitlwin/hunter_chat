// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatScreenState {

 bool get isLoading; String? get messageKey; String get chatTitle; String get firebaseChatDocumentName; List<ChatMessageDomain> get messages; DocumentSnapshot? get lastDocument; bool get hasMore; String? get chatContent; List<XFile>? get imageFiles; List<XFile>? get videoFiles; List<XFile>? get otherFiles; JoyUser? get currentUser;
/// Create a copy of ChatScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatScreenStateCopyWith<ChatScreenState> get copyWith => _$ChatScreenStateCopyWithImpl<ChatScreenState>(this as ChatScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatScreenState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.messageKey, messageKey) || other.messageKey == messageKey)&&(identical(other.chatTitle, chatTitle) || other.chatTitle == chatTitle)&&(identical(other.firebaseChatDocumentName, firebaseChatDocumentName) || other.firebaseChatDocumentName == firebaseChatDocumentName)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.lastDocument, lastDocument) || other.lastDocument == lastDocument)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.chatContent, chatContent) || other.chatContent == chatContent)&&const DeepCollectionEquality().equals(other.imageFiles, imageFiles)&&const DeepCollectionEquality().equals(other.videoFiles, videoFiles)&&const DeepCollectionEquality().equals(other.otherFiles, otherFiles)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,messageKey,chatTitle,firebaseChatDocumentName,const DeepCollectionEquality().hash(messages),lastDocument,hasMore,chatContent,const DeepCollectionEquality().hash(imageFiles),const DeepCollectionEquality().hash(videoFiles),const DeepCollectionEquality().hash(otherFiles),currentUser);

@override
String toString() {
  return 'ChatScreenState(isLoading: $isLoading, messageKey: $messageKey, chatTitle: $chatTitle, firebaseChatDocumentName: $firebaseChatDocumentName, messages: $messages, lastDocument: $lastDocument, hasMore: $hasMore, chatContent: $chatContent, imageFiles: $imageFiles, videoFiles: $videoFiles, otherFiles: $otherFiles, currentUser: $currentUser)';
}


}

/// @nodoc
abstract mixin class $ChatScreenStateCopyWith<$Res>  {
  factory $ChatScreenStateCopyWith(ChatScreenState value, $Res Function(ChatScreenState) _then) = _$ChatScreenStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? messageKey, String chatTitle, String firebaseChatDocumentName, List<ChatMessageDomain> messages, DocumentSnapshot? lastDocument, bool hasMore, String? chatContent, List<XFile>? imageFiles, List<XFile>? videoFiles, List<XFile>? otherFiles, JoyUser? currentUser
});


$JoyUserCopyWith<$Res>? get currentUser;

}
/// @nodoc
class _$ChatScreenStateCopyWithImpl<$Res>
    implements $ChatScreenStateCopyWith<$Res> {
  _$ChatScreenStateCopyWithImpl(this._self, this._then);

  final ChatScreenState _self;
  final $Res Function(ChatScreenState) _then;

/// Create a copy of ChatScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? messageKey = freezed,Object? chatTitle = null,Object? firebaseChatDocumentName = null,Object? messages = null,Object? lastDocument = freezed,Object? hasMore = null,Object? chatContent = freezed,Object? imageFiles = freezed,Object? videoFiles = freezed,Object? otherFiles = freezed,Object? currentUser = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,messageKey: freezed == messageKey ? _self.messageKey : messageKey // ignore: cast_nullable_to_non_nullable
as String?,chatTitle: null == chatTitle ? _self.chatTitle : chatTitle // ignore: cast_nullable_to_non_nullable
as String,firebaseChatDocumentName: null == firebaseChatDocumentName ? _self.firebaseChatDocumentName : firebaseChatDocumentName // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessageDomain>,lastDocument: freezed == lastDocument ? _self.lastDocument : lastDocument // ignore: cast_nullable_to_non_nullable
as DocumentSnapshot?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,chatContent: freezed == chatContent ? _self.chatContent : chatContent // ignore: cast_nullable_to_non_nullable
as String?,imageFiles: freezed == imageFiles ? _self.imageFiles : imageFiles // ignore: cast_nullable_to_non_nullable
as List<XFile>?,videoFiles: freezed == videoFiles ? _self.videoFiles : videoFiles // ignore: cast_nullable_to_non_nullable
as List<XFile>?,otherFiles: freezed == otherFiles ? _self.otherFiles : otherFiles // ignore: cast_nullable_to_non_nullable
as List<XFile>?,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as JoyUser?,
  ));
}
/// Create a copy of ChatScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JoyUserCopyWith<$Res>? get currentUser {
    if (_self.currentUser == null) {
    return null;
  }

  return $JoyUserCopyWith<$Res>(_self.currentUser!, (value) {
    return _then(_self.copyWith(currentUser: value));
  });
}
}


/// @nodoc


class _ChatScreenState implements ChatScreenState {
  const _ChatScreenState({required this.isLoading, required this.messageKey, required this.chatTitle, required this.firebaseChatDocumentName, required final  List<ChatMessageDomain> messages, required this.lastDocument, required this.hasMore, required this.chatContent, required final  List<XFile>? imageFiles, required final  List<XFile>? videoFiles, required final  List<XFile>? otherFiles, this.currentUser}): _messages = messages,_imageFiles = imageFiles,_videoFiles = videoFiles,_otherFiles = otherFiles;
  

@override final  bool isLoading;
@override final  String? messageKey;
@override final  String chatTitle;
@override final  String firebaseChatDocumentName;
 final  List<ChatMessageDomain> _messages;
@override List<ChatMessageDomain> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override final  DocumentSnapshot? lastDocument;
@override final  bool hasMore;
@override final  String? chatContent;
 final  List<XFile>? _imageFiles;
@override List<XFile>? get imageFiles {
  final value = _imageFiles;
  if (value == null) return null;
  if (_imageFiles is EqualUnmodifiableListView) return _imageFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<XFile>? _videoFiles;
@override List<XFile>? get videoFiles {
  final value = _videoFiles;
  if (value == null) return null;
  if (_videoFiles is EqualUnmodifiableListView) return _videoFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<XFile>? _otherFiles;
@override List<XFile>? get otherFiles {
  final value = _otherFiles;
  if (value == null) return null;
  if (_otherFiles is EqualUnmodifiableListView) return _otherFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  JoyUser? currentUser;

/// Create a copy of ChatScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatScreenStateCopyWith<_ChatScreenState> get copyWith => __$ChatScreenStateCopyWithImpl<_ChatScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatScreenState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.messageKey, messageKey) || other.messageKey == messageKey)&&(identical(other.chatTitle, chatTitle) || other.chatTitle == chatTitle)&&(identical(other.firebaseChatDocumentName, firebaseChatDocumentName) || other.firebaseChatDocumentName == firebaseChatDocumentName)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.lastDocument, lastDocument) || other.lastDocument == lastDocument)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.chatContent, chatContent) || other.chatContent == chatContent)&&const DeepCollectionEquality().equals(other._imageFiles, _imageFiles)&&const DeepCollectionEquality().equals(other._videoFiles, _videoFiles)&&const DeepCollectionEquality().equals(other._otherFiles, _otherFiles)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,messageKey,chatTitle,firebaseChatDocumentName,const DeepCollectionEquality().hash(_messages),lastDocument,hasMore,chatContent,const DeepCollectionEquality().hash(_imageFiles),const DeepCollectionEquality().hash(_videoFiles),const DeepCollectionEquality().hash(_otherFiles),currentUser);

@override
String toString() {
  return 'ChatScreenState(isLoading: $isLoading, messageKey: $messageKey, chatTitle: $chatTitle, firebaseChatDocumentName: $firebaseChatDocumentName, messages: $messages, lastDocument: $lastDocument, hasMore: $hasMore, chatContent: $chatContent, imageFiles: $imageFiles, videoFiles: $videoFiles, otherFiles: $otherFiles, currentUser: $currentUser)';
}


}

/// @nodoc
abstract mixin class _$ChatScreenStateCopyWith<$Res> implements $ChatScreenStateCopyWith<$Res> {
  factory _$ChatScreenStateCopyWith(_ChatScreenState value, $Res Function(_ChatScreenState) _then) = __$ChatScreenStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? messageKey, String chatTitle, String firebaseChatDocumentName, List<ChatMessageDomain> messages, DocumentSnapshot? lastDocument, bool hasMore, String? chatContent, List<XFile>? imageFiles, List<XFile>? videoFiles, List<XFile>? otherFiles, JoyUser? currentUser
});


@override $JoyUserCopyWith<$Res>? get currentUser;

}
/// @nodoc
class __$ChatScreenStateCopyWithImpl<$Res>
    implements _$ChatScreenStateCopyWith<$Res> {
  __$ChatScreenStateCopyWithImpl(this._self, this._then);

  final _ChatScreenState _self;
  final $Res Function(_ChatScreenState) _then;

/// Create a copy of ChatScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? messageKey = freezed,Object? chatTitle = null,Object? firebaseChatDocumentName = null,Object? messages = null,Object? lastDocument = freezed,Object? hasMore = null,Object? chatContent = freezed,Object? imageFiles = freezed,Object? videoFiles = freezed,Object? otherFiles = freezed,Object? currentUser = freezed,}) {
  return _then(_ChatScreenState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,messageKey: freezed == messageKey ? _self.messageKey : messageKey // ignore: cast_nullable_to_non_nullable
as String?,chatTitle: null == chatTitle ? _self.chatTitle : chatTitle // ignore: cast_nullable_to_non_nullable
as String,firebaseChatDocumentName: null == firebaseChatDocumentName ? _self.firebaseChatDocumentName : firebaseChatDocumentName // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessageDomain>,lastDocument: freezed == lastDocument ? _self.lastDocument : lastDocument // ignore: cast_nullable_to_non_nullable
as DocumentSnapshot?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,chatContent: freezed == chatContent ? _self.chatContent : chatContent // ignore: cast_nullable_to_non_nullable
as String?,imageFiles: freezed == imageFiles ? _self._imageFiles : imageFiles // ignore: cast_nullable_to_non_nullable
as List<XFile>?,videoFiles: freezed == videoFiles ? _self._videoFiles : videoFiles // ignore: cast_nullable_to_non_nullable
as List<XFile>?,otherFiles: freezed == otherFiles ? _self._otherFiles : otherFiles // ignore: cast_nullable_to_non_nullable
as List<XFile>?,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as JoyUser?,
  ));
}

/// Create a copy of ChatScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JoyUserCopyWith<$Res>? get currentUser {
    if (_self.currentUser == null) {
    return null;
  }

  return $JoyUserCopyWith<$Res>(_self.currentUser!, (value) {
    return _then(_self.copyWith(currentUser: value));
  });
}
}

// dart format on
