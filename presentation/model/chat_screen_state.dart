import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart' show XFile;
import 'package:joy_app/src/feature/chat/domain/model/chat_message_domain.dart';
import 'package:joy_app/src/feature/profile/domain/model/joy_user.dart';

part 'chat_screen_state.freezed.dart';

@freezed
abstract class ChatScreenState with _$ChatScreenState {
  const factory ChatScreenState({
    required bool isLoading,
    required String? messageKey,
    required String chatTitle,
    required String firebaseChatDocumentName,
    required List<ChatMessageDomain> messages,
    required DocumentSnapshot? lastDocument,
    required bool hasMore,
    required String? chatContent,
    required List<XFile>? imageFiles,
    required List<XFile>? videoFiles,
    required List<XFile>? otherFiles,
    JoyUser? currentUser,
  }) = _ChatScreenState;

  factory ChatScreenState.initial() => const _ChatScreenState(
        isLoading: false,
        messageKey: null,
        chatTitle: '',
        firebaseChatDocumentName: '',
        messages: [],
        lastDocument: null,
        hasMore: true,
        chatContent: null,
        imageFiles: null,
        videoFiles: null,
        otherFiles: null,
      );
}
