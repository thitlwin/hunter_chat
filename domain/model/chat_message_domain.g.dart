// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessageDomain _$ChatMessageDomainFromJson(Map<String, dynamic> json) =>
    _ChatMessageDomain(
      id: json['id'] as String?,
      userId: (json['customer_id'] as num?)?.toInt(),
      content: json['content'] as String?,
      batchId: (json['batch_id'] as num?)?.toInt(),
      fileUrls:
          (json['files'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: const TimestampDateTimeConverter()
          .fromJson(json['created_at'] as Timestamp),
      updatedAt: const TimestampDateTimeConverter()
          .fromJson(json['updated_at'] as Timestamp),
      user: json['user'] == null
          ? null
          : ChatUserDomain.fromJson(json['user'] as Map<String, dynamic>),
      parent: json['parent'] == null
          ? null
          : ChatMessageDomain.fromJson(json['parent'] as Map<String, dynamic>),
      isReply: json['isReply'] as bool? ?? false,
      filesNames: (json['file_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isUploading: json['is_uploading'] as bool? ?? false,
    );

Map<String, dynamic> _$ChatMessageDomainToJson(_ChatMessageDomain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.userId,
      'content': instance.content,
      'batch_id': instance.batchId,
      'files': instance.fileUrls,
      'created_at':
          const TimestampDateTimeConverter().toJson(instance.createdAt),
      'updated_at':
          const TimestampDateTimeConverter().toJson(instance.updatedAt),
      'user': instance.user,
      'parent': instance.parent,
      'isReply': instance.isReply,
      'file_names': instance.filesNames,
      'is_uploading': instance.isUploading,
    };

_ChatUserDomain _$ChatUserDomainFromJson(Map<String, dynamic> json) =>
    _ChatUserDomain(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      role: json['role'] as String?,
      profilePicture: json['profile_picture'] as String?,
    );

Map<String, dynamic> _$ChatUserDomainToJson(_ChatUserDomain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'profile_picture': instance.profilePicture,
    };
