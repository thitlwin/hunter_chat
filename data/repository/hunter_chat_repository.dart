import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:joy_app/src/core/data/remote/remote_data_source.dart';
import 'package:joy_app/src/core/utils/dio_error_handler.dart';
import 'package:joy_app/src/core/utils/failure.dart';
import 'package:joy_app/src/feature/chat/domain/model/chat_message_domain.dart';
import 'package:joy_app/src/feature/chat/domain/repository/hunter_chat_repository.dart';
import 'package:joy_app/src/feature/chat/util/chat_constant.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hunter_chat_repository.g.dart';

@riverpod
HunterChatRepository hunterChatRepository(Ref ref) {
  final remoteDataSource = ref.watch(remoteDataSourceProvider);
  return HunterChatRepository(remoteDataSource);
}

final class HunterChatRepository implements IHunterChatRepository {
  final RemoteDataSource _remoteDataSource;
  HunterChatRepository(this._remoteDataSource);

  CollectionReference _getCollectionReference(String documentName) {
    return _documentReference(documentName).collection('messages');
  }

  DocumentReference<Map<String, dynamic>> _documentReference(
      String documentName) {
    return FirebaseFirestore.instance.collection('chats').doc(documentName);
  }

  @override
  Future<Either<Failure, List<ChatMessageDomain>>> getHunterChat(
      String documentName,
      {DocumentSnapshot? lastDoc}) async {
    try {
      var query = _getCollectionReference(documentName)
          .orderBy("created_at", descending: true)
          .limit(ChatConstant.CHAT_PAGE_SIZE); // Use constant for page size

      if (lastDoc != null) {
        query = query.startAfterDocument(lastDoc);
      }

      final querySnapshot = await query.get();
      final messages = querySnapshot.docs
          .map((doc) {
            final data = doc.data();
            if (data is Map<String, dynamic>) {
              return ChatMessageDomain.fromJson(data)
                  .copyWith(documentSnapshot: doc);
            }
            return null;
          })
          .whereType<ChatMessageDomain>()
          .toList(); // Filter out nulls
      return Right(messages);
    } on FirebaseException catch (e) {
      return Left(Failure.unexpectedError('Firestore error: ${e.message}'));
    } catch (e) {
      return Left(Failure.unexpectedError('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Stream<List<ChatMessageDomain>> getHunterChatStream(String documentName) {
    try {
      final query = _getCollectionReference(documentName)
          .orderBy("created_at", descending: true)
          .limit(50); // Limit to the most recent 50 messages for performance.

      return query.snapshots().map((snapshot) => snapshot.docs.map((doc) {
            return ChatMessageDomain.fromJson(
                    doc.data() as Map<String, dynamic>)
                .copyWith(documentSnapshot: doc);
          }).toList());
    } on FirebaseException catch (e) {
      throw Failure.unexpectedError('Firestore error: ${e.message}');
    } catch (e) {
      throw Failure.unexpectedError('Unexpected error: ${e.toString()}');
    }
  }

  @override
  Future<Either<Failure, void>> sendHunterChat(
    String documentName,
    ChatMessageDomain message,
  ) async {
    try {
      final counterDoc = _getCollectionReference(documentName);
      final messageMap = message.toJson();
      messageMap['user'] =
          message.user?.toJson(); // Explicitly serialize the 'user' field
      await counterDoc.add(messageMap).then((msg) {
        _documentReference(documentName)
            .set({"latest_updated_time": message.createdAt});
      });
      return const Right(null);
    } catch (e) {
      return Left(
          Failure.unexpectedError('Failed to send message: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> uploadChatAttachments(
      {required List<String> filePaths}) async {
    try {
      return await _remoteDataSource.uploadMultipleFiles(filePaths);
    } on DioException catch (e) {
      return Left(handleDioException(e));
    } catch (e) {
      return Left(Failure.unexpectedError(
          'An unexpected error occurred: ${e.toString()}'));
    }
  }
}
