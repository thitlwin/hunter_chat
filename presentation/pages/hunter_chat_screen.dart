import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:language_hunter_app/src/feature/hunter_auth/presentation/provider/hunter_auth_provider.dart';
import 'package:language_hunter_app/src/feature/hunter_chat/domain/model/chat_message.dart';
import 'package:language_hunter_app/src/feature/hunter_chat/presentation/components/circular_image.dart';
import 'package:language_hunter_app/src/feature/hunter_chat/presentation/components/customUrlText.dart';
import 'package:language_hunter_app/src/feature/hunter_chat/presentation/provider/hunter_chat_provider.dart';
import 'package:language_hunter_app/src/feature/hunter_chat/util/chat_utility.dart';

class HunterChatScreen extends StatefulHookConsumerWidget {
  final String documentName = 'admin-101';
  const HunterChatScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HunterChatScreenState();
}

class _HunterChatScreenState extends ConsumerState<HunterChatScreen> {
  final messageController = TextEditingController();
  late GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final chatProvider = hunterChatProvider(widget.documentName);
  final _focusNode = FocusNode();

  late ScrollController _scrollController;
  bool _isFetchingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Avoid multiple calls
      if (!_isFetchingMore) {
        _isFetchingMore = true;
        ref
            .read(chatProvider.notifier)
            .loadMoreMessages(widget.documentName)
            .then((_) => _isFetchingMore = false);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Clean up the controller
    super.dispose();
  }

  Widget _chatScreenBody() {
    final chatState = ref.watch(chatProvider);

    return chatState.when(
      data: (messages) {
        if (messages.isEmpty) {
          return const Center(
            child: Text(
              'No message found',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          );
        }
        return ListView.builder(
          reverse: true, // To start at the latest message
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return chatMessage(messages[index]!, context);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
    );
  }

  // Widget _chatScreenBody() {
  //   final chatState = ref.watch(chatProvider);
  //   if (chatState.value == null || chatState.value!.isEmpty) {
  //     return const Center(
  //       child: Text(
  //         'No message found',
  //         style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
  //       ),
  //     );
  //   }

  //   return chatState.when(
  //     data: (messages) => ListView.builder(
  //       reverse: true, // To start at the latest message
  //       shrinkWrap: true,
  //       physics: const BouncingScrollPhysics(),
  //       controller: _scrollController,
  //       itemCount: messages.length,
  //       itemBuilder: (context, index) {
  //         return chatMessage(messages[index]!, context);
  //       },
  //     ),
  //     loading: () => const CircularProgressIndicator(),
  //     error: (err, _) => Text('Error: $err'),
  //   );
  // }

  Widget chatMessage(ChatMessage message, BuildContext context) {
    // if (senderId == null) {
    //   return Container();
    // }
    // if (message.senderId == senderId) {
    //   return _message(message, true);
    // } else {
    //   return _message(message, false);
    // }
    return _message(message, false, context);
  }

  Widget _message(ChatMessage chat, bool myMessage, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment:
          myMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisAlignment:
          myMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const SizedBox(
              width: 15,
            ),
            myMessage
                ? const SizedBox()
                : CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: customAdvanceNetworkImage(null),
                  ),
            Expanded(
              child: Container(
                alignment:
                    myMessage ? Alignment.centerRight : Alignment.centerLeft,
                margin: EdgeInsets.only(
                  right: myMessage ? 10 : (width / 4),
                  top: 20,
                  left: myMessage ? (width / 4) : 10,
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: getBorder(myMessage),
                          color: Colors.blueGrey),
                      child: UrlText(
                        text: chat.message!,
                        style: TextStyle(
                          fontSize: 16,
                          color: myMessage ? Colors.white : Colors.black,
                        ),
                        urlStyle: TextStyle(
                          fontSize: 16,
                          color: myMessage ? Colors.white : Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Text(
            ChatUtility.getChatTime(chat.createdAt),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        )
      ],
    );
  }

  BorderRadius getBorder(bool myMessage) {
    return BorderRadius.only(
      topLeft: const Radius.circular(20),
      topRight: const Radius.circular(20),
      bottomRight:
          myMessage ? const Radius.circular(0) : const Radius.circular(20),
      bottomLeft:
          myMessage ? const Radius.circular(20) : const Radius.circular(0),
    );
  }

  Widget _bottomEntryField() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const Divider(
            thickness: 0,
            height: 1,
          ),
          TextField(
            onSubmitted: (val) async {
              submitMessage();
            },
            focusNode: _focusNode,
            controller: messageController,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
              alignLabelWithHint: true,
              hintText: 'Start with a message...',
              suffixIcon: IconButton(
                  icon: const Icon(Icons.send), onPressed: submitMessage),
            ),
          ),
        ],
      ),
    );
  }

  // Future<bool> _onWillPop() async {
  //   state.setIsChatScreenOpen = false;
  //   state.onChatScreenClosed();
  //   return true;
  // }

  void submitMessage() {
    final chatState = ref.watch(chatProvider);
    var authState = ref.watch(hunterAuthProvider);
    ChatMessage message;
    message = ChatMessage(
        message: messageController.text,
        createdAt: DateTime.now().toUtc().toString(),
        senderId: authState.userId.toString(),
        receiverId: "chatState.chatUser!.userId!",
        seen: false,
        timeStamp: DateTime.now().toUtc().millisecondsSinceEpoch,
        senderName: "SenderName");
    if (messageController.text.isEmpty) {
      return;
    }
    ref.read(chatProvider.notifier).submitMessage(message);
    Future.delayed(const Duration(milliseconds: 50)).then((_) {
      messageController.clear();
      // Request focus after submitting the message
      _focusNode.requestFocus();
    });
    try {
      if (chatState.value != null &&
          chatState.value!.length > 1 &&
          _scrollController.offset > 0) {
        _scrollController.animateTo(
          0.0,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
      }
    } catch (e) {
      print("[Error] $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UrlText(
              text: "state.chatUser!.displayName!",
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "state.chatUser!.userName!",
              style: const TextStyle(color: Colors.blue, fontSize: 15),
            )
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.info, color: Colors.green),
              onPressed: () {
                // Navigator.pushNamed(context, '/ConversationInformation');
              })
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: _chatScreenBody(),
              ),
            ),
            _bottomEntryField()
          ],
        ),
      ),
    );
  }
}
