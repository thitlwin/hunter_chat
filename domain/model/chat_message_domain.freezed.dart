// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_domain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessageDomain {
  @JsonKey(name: "id")
  String? get id;
  @JsonKey(name: "customer_id")
  int? get userId;
  @JsonKey(name: "content")
  String? get content;
  @JsonKey(name: "batch_id")
  int? get batchId;
  @JsonKey(name: ChatConstants.files_field)
  List<String>? get fileUrls;
  @TimestampDateTimeConverter()
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @TimestampDateTimeConverter()
  @JsonKey(name: "updated_at")
  DateTime get updatedAt;
  @JsonKey(name: "user")
  ChatUserDomain? get user;
  @JsonKey(name: "parent")
  ChatMessageDomain? get parent;
  bool get isReply;
  @JsonKey(name: "file_names")
  List<String>? get filesNames;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @DocumentSnapshotConverter()
  DocumentSnapshot? get documentSnapshot;
  @JsonKey(name: ChatConstants.isUploading_field)
  bool get isUploading;

  /// Create a copy of ChatMessageDomain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatMessageDomainCopyWith<ChatMessageDomain> get copyWith =>
      _$ChatMessageDomainCopyWithImpl<ChatMessageDomain>(
          this as ChatMessageDomain, _$identity);

  /// Serializes this ChatMessageDomain to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatMessageDomain &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            const DeepCollectionEquality().equals(other.fileUrls, fileUrls) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.isReply, isReply) || other.isReply == isReply) &&
            const DeepCollectionEquality()
                .equals(other.filesNames, filesNames) &&
            (identical(other.documentSnapshot, documentSnapshot) ||
                other.documentSnapshot == documentSnapshot) &&
            (identical(other.isUploading, isUploading) ||
                other.isUploading == isUploading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      content,
      batchId,
      const DeepCollectionEquality().hash(fileUrls),
      createdAt,
      updatedAt,
      user,
      parent,
      isReply,
      const DeepCollectionEquality().hash(filesNames),
      documentSnapshot,
      isUploading);

  @override
  String toString() {
    return 'ChatMessageDomain(id: $id, userId: $userId, content: $content, batchId: $batchId, fileUrls: $fileUrls, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, parent: $parent, isReply: $isReply, filesNames: $filesNames, documentSnapshot: $documentSnapshot, isUploading: $isUploading)';
  }
}

/// @nodoc
abstract mixin class $ChatMessageDomainCopyWith<$Res> {
  factory $ChatMessageDomainCopyWith(
          ChatMessageDomain value, $Res Function(ChatMessageDomain) _then) =
      _$ChatMessageDomainCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "customer_id") int? userId,
      @JsonKey(name: "content") String? content,
      @JsonKey(name: "batch_id") int? batchId,
      @JsonKey(name: ChatConstants.files_field) List<String>? fileUrls,
      @TimestampDateTimeConverter()
      @JsonKey(name: "created_at")
      DateTime createdAt,
      @TimestampDateTimeConverter()
      @JsonKey(name: "updated_at")
      DateTime updatedAt,
      @JsonKey(name: "user") ChatUserDomain? user,
      @JsonKey(name: "parent") ChatMessageDomain? parent,
      bool isReply,
      @JsonKey(name: "file_names") List<String>? filesNames,
      @JsonKey(includeFromJson: false, includeToJson: false)
      @DocumentSnapshotConverter()
      DocumentSnapshot? documentSnapshot,
      @JsonKey(name: ChatConstants.isUploading_field) bool isUploading});

  $ChatUserDomainCopyWith<$Res>? get user;
  $ChatMessageDomainCopyWith<$Res>? get parent;
}

/// @nodoc
class _$ChatMessageDomainCopyWithImpl<$Res>
    implements $ChatMessageDomainCopyWith<$Res> {
  _$ChatMessageDomainCopyWithImpl(this._self, this._then);

  final ChatMessageDomain _self;
  final $Res Function(ChatMessageDomain) _then;

  /// Create a copy of ChatMessageDomain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? content = freezed,
    Object? batchId = freezed,
    Object? fileUrls = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = freezed,
    Object? parent = freezed,
    Object? isReply = null,
    Object? filesNames = freezed,
    Object? documentSnapshot = freezed,
    Object? isUploading = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      fileUrls: freezed == fileUrls
          ? _self.fileUrls
          : fileUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as ChatUserDomain?,
      parent: freezed == parent
          ? _self.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as ChatMessageDomain?,
      isReply: null == isReply
          ? _self.isReply
          : isReply // ignore: cast_nullable_to_non_nullable
              as bool,
      filesNames: freezed == filesNames
          ? _self.filesNames
          : filesNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      documentSnapshot: freezed == documentSnapshot
          ? _self.documentSnapshot
          : documentSnapshot // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot?,
      isUploading: null == isUploading
          ? _self.isUploading
          : isUploading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ChatMessageDomain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatUserDomainCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $ChatUserDomainCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of ChatMessageDomain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageDomainCopyWith<$Res>? get parent {
    if (_self.parent == null) {
      return null;
    }

    return $ChatMessageDomainCopyWith<$Res>(_self.parent!, (value) {
      return _then(_self.copyWith(parent: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ChatMessageDomain implements ChatMessageDomain {
  _ChatMessageDomain(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "customer_id") this.userId,
      @JsonKey(name: "content") this.content,
      @JsonKey(name: "batch_id") this.batchId,
      @JsonKey(name: ChatConstants.files_field) final List<String>? fileUrls,
      @TimestampDateTimeConverter()
      @JsonKey(name: "created_at")
      required this.createdAt,
      @TimestampDateTimeConverter()
      @JsonKey(name: "updated_at")
      required this.updatedAt,
      @JsonKey(name: "user") this.user,
      @JsonKey(name: "parent") this.parent,
      this.isReply = false,
      @JsonKey(name: "file_names") final List<String>? filesNames,
      @JsonKey(includeFromJson: false, includeToJson: false)
      @DocumentSnapshotConverter()
      this.documentSnapshot,
      @JsonKey(name: ChatConstants.isUploading_field) this.isUploading = false})
      : _fileUrls = fileUrls,
        _filesNames = filesNames;
  factory _ChatMessageDomain.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageDomainFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "customer_id")
  final int? userId;
  @override
  @JsonKey(name: "content")
  final String? content;
  @override
  @JsonKey(name: "batch_id")
  final int? batchId;
  final List<String>? _fileUrls;
  @override
  @JsonKey(name: ChatConstants.files_field)
  List<String>? get fileUrls {
    final value = _fileUrls;
    if (value == null) return null;
    if (_fileUrls is EqualUnmodifiableListView) return _fileUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @TimestampDateTimeConverter()
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @TimestampDateTimeConverter()
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @override
  @JsonKey(name: "user")
  final ChatUserDomain? user;
  @override
  @JsonKey(name: "parent")
  final ChatMessageDomain? parent;
  @override
  @JsonKey()
  final bool isReply;
  final List<String>? _filesNames;
  @override
  @JsonKey(name: "file_names")
  List<String>? get filesNames {
    final value = _filesNames;
    if (value == null) return null;
    if (_filesNames is EqualUnmodifiableListView) return _filesNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @DocumentSnapshotConverter()
  final DocumentSnapshot? documentSnapshot;
  @override
  @JsonKey(name: ChatConstants.isUploading_field)
  final bool isUploading;

  /// Create a copy of ChatMessageDomain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatMessageDomainCopyWith<_ChatMessageDomain> get copyWith =>
      __$ChatMessageDomainCopyWithImpl<_ChatMessageDomain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatMessageDomainToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessageDomain &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            const DeepCollectionEquality().equals(other._fileUrls, _fileUrls) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.isReply, isReply) || other.isReply == isReply) &&
            const DeepCollectionEquality()
                .equals(other._filesNames, _filesNames) &&
            (identical(other.documentSnapshot, documentSnapshot) ||
                other.documentSnapshot == documentSnapshot) &&
            (identical(other.isUploading, isUploading) ||
                other.isUploading == isUploading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      content,
      batchId,
      const DeepCollectionEquality().hash(_fileUrls),
      createdAt,
      updatedAt,
      user,
      parent,
      isReply,
      const DeepCollectionEquality().hash(_filesNames),
      documentSnapshot,
      isUploading);

  @override
  String toString() {
    return 'ChatMessageDomain(id: $id, userId: $userId, content: $content, batchId: $batchId, fileUrls: $fileUrls, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, parent: $parent, isReply: $isReply, filesNames: $filesNames, documentSnapshot: $documentSnapshot, isUploading: $isUploading)';
  }
}

/// @nodoc
abstract mixin class _$ChatMessageDomainCopyWith<$Res>
    implements $ChatMessageDomainCopyWith<$Res> {
  factory _$ChatMessageDomainCopyWith(
          _ChatMessageDomain value, $Res Function(_ChatMessageDomain) _then) =
      __$ChatMessageDomainCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "customer_id") int? userId,
      @JsonKey(name: "content") String? content,
      @JsonKey(name: "batch_id") int? batchId,
      @JsonKey(name: ChatConstants.files_field) List<String>? fileUrls,
      @TimestampDateTimeConverter()
      @JsonKey(name: "created_at")
      DateTime createdAt,
      @TimestampDateTimeConverter()
      @JsonKey(name: "updated_at")
      DateTime updatedAt,
      @JsonKey(name: "user") ChatUserDomain? user,
      @JsonKey(name: "parent") ChatMessageDomain? parent,
      bool isReply,
      @JsonKey(name: "file_names") List<String>? filesNames,
      @JsonKey(includeFromJson: false, includeToJson: false)
      @DocumentSnapshotConverter()
      DocumentSnapshot? documentSnapshot,
      @JsonKey(name: ChatConstants.isUploading_field) bool isUploading});

  @override
  $ChatUserDomainCopyWith<$Res>? get user;
  @override
  $ChatMessageDomainCopyWith<$Res>? get parent;
}

/// @nodoc
class __$ChatMessageDomainCopyWithImpl<$Res>
    implements _$ChatMessageDomainCopyWith<$Res> {
  __$ChatMessageDomainCopyWithImpl(this._self, this._then);

  final _ChatMessageDomain _self;
  final $Res Function(_ChatMessageDomain) _then;

  /// Create a copy of ChatMessageDomain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? content = freezed,
    Object? batchId = freezed,
    Object? fileUrls = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = freezed,
    Object? parent = freezed,
    Object? isReply = null,
    Object? filesNames = freezed,
    Object? documentSnapshot = freezed,
    Object? isUploading = null,
  }) {
    return _then(_ChatMessageDomain(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      batchId: freezed == batchId
          ? _self.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as int?,
      fileUrls: freezed == fileUrls
          ? _self._fileUrls
          : fileUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as ChatUserDomain?,
      parent: freezed == parent
          ? _self.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as ChatMessageDomain?,
      isReply: null == isReply
          ? _self.isReply
          : isReply // ignore: cast_nullable_to_non_nullable
              as bool,
      filesNames: freezed == filesNames
          ? _self._filesNames
          : filesNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      documentSnapshot: freezed == documentSnapshot
          ? _self.documentSnapshot
          : documentSnapshot // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot?,
      isUploading: null == isUploading
          ? _self.isUploading
          : isUploading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ChatMessageDomain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatUserDomainCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $ChatUserDomainCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of ChatMessageDomain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageDomainCopyWith<$Res>? get parent {
    if (_self.parent == null) {
      return null;
    }

    return $ChatMessageDomainCopyWith<$Res>(_self.parent!, (value) {
      return _then(_self.copyWith(parent: value));
    });
  }
}

/// @nodoc
mixin _$ChatUserDomain {
  int? get id;
  String? get name;
  String? get role;
  @JsonKey(name: "profile_picture")
  String? get profilePicture;

  /// Create a copy of ChatUserDomain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatUserDomainCopyWith<ChatUserDomain> get copyWith =>
      _$ChatUserDomainCopyWithImpl<ChatUserDomain>(
          this as ChatUserDomain, _$identity);

  /// Serializes this ChatUserDomain to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatUserDomain &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, role, profilePicture);

  @override
  String toString() {
    return 'ChatUserDomain(id: $id, name: $name, role: $role, profilePicture: $profilePicture)';
  }
}

/// @nodoc
abstract mixin class $ChatUserDomainCopyWith<$Res> {
  factory $ChatUserDomainCopyWith(
          ChatUserDomain value, $Res Function(ChatUserDomain) _then) =
      _$ChatUserDomainCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? role,
      @JsonKey(name: "profile_picture") String? profilePicture});
}

/// @nodoc
class _$ChatUserDomainCopyWithImpl<$Res>
    implements $ChatUserDomainCopyWith<$Res> {
  _$ChatUserDomainCopyWithImpl(this._self, this._then);

  final ChatUserDomain _self;
  final $Res Function(ChatUserDomain) _then;

  /// Create a copy of ChatUserDomain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? role = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _self.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChatUserDomain implements ChatUserDomain {
  _ChatUserDomain(
      {this.id,
      this.name,
      this.role,
      @JsonKey(name: "profile_picture") this.profilePicture});
  factory _ChatUserDomain.fromJson(Map<String, dynamic> json) =>
      _$ChatUserDomainFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? role;
  @override
  @JsonKey(name: "profile_picture")
  final String? profilePicture;

  /// Create a copy of ChatUserDomain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatUserDomainCopyWith<_ChatUserDomain> get copyWith =>
      __$ChatUserDomainCopyWithImpl<_ChatUserDomain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatUserDomainToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatUserDomain &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, role, profilePicture);

  @override
  String toString() {
    return 'ChatUserDomain(id: $id, name: $name, role: $role, profilePicture: $profilePicture)';
  }
}

/// @nodoc
abstract mixin class _$ChatUserDomainCopyWith<$Res>
    implements $ChatUserDomainCopyWith<$Res> {
  factory _$ChatUserDomainCopyWith(
          _ChatUserDomain value, $Res Function(_ChatUserDomain) _then) =
      __$ChatUserDomainCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? role,
      @JsonKey(name: "profile_picture") String? profilePicture});
}

/// @nodoc
class __$ChatUserDomainCopyWithImpl<$Res>
    implements _$ChatUserDomainCopyWith<$Res> {
  __$ChatUserDomainCopyWithImpl(this._self, this._then);

  final _ChatUserDomain _self;
  final $Res Function(_ChatUserDomain) _then;

  /// Create a copy of ChatUserDomain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? role = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_ChatUserDomain(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _self.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
