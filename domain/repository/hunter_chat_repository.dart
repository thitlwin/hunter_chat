import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:joy_app/src/core/utils/failure.dart';
import 'package:joy_app/src/feature/chat/domain/model/chat_message_domain.dart';

abstract class IHunterChatRepository {
  Stream<List<ChatMessageDomain>> getHunterChatStream(String documentName);
  Future<Either<Failure, DocumentReference<Object?>>> sendHunterChat(
      String documentName, ChatMessageDomain message);

  Future<Either<Failure, List<String>>> uploadChatAttachments(
      {required List<String> filePaths});

  Future<Either<Failure, List<ChatMessageDomain>>> getHunterChat(
      String documentName,
      {DocumentSnapshot? lastDoc});
}
