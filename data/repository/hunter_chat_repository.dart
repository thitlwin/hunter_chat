import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:language_hunter_app/src/feature/hunter_chat/domain/model/chat_message.dart';
import 'package:language_hunter_app/src/feature/hunter_chat/domain/repository/hunter_chat_repository.dart';
import 'package:language_hunter_app/src/feature/hunter_chat/util/chat_constant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hunter_chat_repository.g.dart';

@riverpod
HunterChatRepository hunterChatRepository(Ref ref) {
  return HunterChatRepository();
}

final class HunterChatRepository implements IHunterChatRepository {
  HunterChatRepository();

  CollectionReference _getCollectionReference(String documentName) {
    return FirebaseFirestore.instance
        .collection('chats')
        .doc(documentName)
        .collection('messages');
  }

  @override
  HunterChatResult getHunterChat(String documentName,
      {DocumentSnapshot? lastDoc}) async {
    try {
      var query = _getCollectionReference(documentName)
          .orderBy("timeStamp", descending: true)
          .limit(ChatConstant.CHAT_PAGE_SIZE);

      if (lastDoc != null) {
        query = query.startAfterDocument(lastDoc);
      }

      final querySnapshot = await query.get();
      final messages = querySnapshot.docs.map((doc) {
        final data = doc.data();
        if (data is Map<String, dynamic>) {
          return ChatMessage.fromJson(data).copyWith(documentSnapshot: doc);
        }
        return null;
      }).toList();
      return Right(messages);
    } on FirebaseException catch (e) {
      return Left(Left('Firestore error: ${e.message}'));
    } catch (e) {
      return Left(Left('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Left, void>> sendHunterChat(
    String documentName,
    ChatMessage message,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('chats')
          .doc(documentName)
          .collection('messages')
          .add(message.toJson());
      return const Right(null);
    } catch (e) {
      return Left(Left('Failed to send message: ${e.toString()}'));
    }
  }
}
