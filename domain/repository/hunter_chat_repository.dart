import 'package:fpdart/fpdart.dart';
import 'package:language_hunter_app/src/feature/hunter_chat/domain/model/chat_message.dart';

typedef HunterChatResult = Future<Either<Left, List<ChatMessage?>>>;

abstract class IHunterChatRepository {
  HunterChatResult getHunterChat(String documentName);
  Future<Either<Left, void>> sendHunterChat(
      String documentName, ChatMessage message);
}
