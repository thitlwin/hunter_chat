// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hunter_chat_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatMessagesStreamHash() =>
    r'f7b5d27345d2db671a542853e5218279517ef984';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [chatMessagesStream].
@ProviderFor(chatMessagesStream)
const chatMessagesStreamProvider = ChatMessagesStreamFamily();

/// See also [chatMessagesStream].
class ChatMessagesStreamFamily
    extends Family<AsyncValue<List<ChatMessageDomain>>> {
  /// See also [chatMessagesStream].
  const ChatMessagesStreamFamily();

  /// See also [chatMessagesStream].
  ChatMessagesStreamProvider call(
    String documentName,
  ) {
    return ChatMessagesStreamProvider(
      documentName,
    );
  }

  @override
  ChatMessagesStreamProvider getProviderOverride(
    covariant ChatMessagesStreamProvider provider,
  ) {
    return call(
      provider.documentName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatMessagesStreamProvider';
}

/// See also [chatMessagesStream].
class ChatMessagesStreamProvider
    extends AutoDisposeStreamProvider<List<ChatMessageDomain>> {
  /// See also [chatMessagesStream].
  ChatMessagesStreamProvider(
    String documentName,
  ) : this._internal(
          (ref) => chatMessagesStream(
            ref as ChatMessagesStreamRef,
            documentName,
          ),
          from: chatMessagesStreamProvider,
          name: r'chatMessagesStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatMessagesStreamHash,
          dependencies: ChatMessagesStreamFamily._dependencies,
          allTransitiveDependencies:
              ChatMessagesStreamFamily._allTransitiveDependencies,
          documentName: documentName,
        );

  ChatMessagesStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.documentName,
  }) : super.internal();

  final String documentName;

  @override
  Override overrideWith(
    Stream<List<ChatMessageDomain>> Function(ChatMessagesStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChatMessagesStreamProvider._internal(
        (ref) => create(ref as ChatMessagesStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        documentName: documentName,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<ChatMessageDomain>> createElement() {
    return _ChatMessagesStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatMessagesStreamProvider &&
        other.documentName == documentName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, documentName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChatMessagesStreamRef
    on AutoDisposeStreamProviderRef<List<ChatMessageDomain>> {
  /// The parameter `documentName` of this provider.
  String get documentName;
}

class _ChatMessagesStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<ChatMessageDomain>>
    with ChatMessagesStreamRef {
  _ChatMessagesStreamProviderElement(super.provider);

  @override
  String get documentName =>
      (origin as ChatMessagesStreamProvider).documentName;
}

String _$hunterChatScreenNotifierHash() =>
    r'13d871234b4bed96f228fd5b7be1db3b11d793ec';

abstract class _$HunterChatScreenNotifier
    extends BuildlessAutoDisposeAsyncNotifier<ChatScreenState> {
  late final ChatEntry chatEntry;
  late final int? batchId;

  FutureOr<ChatScreenState> build(
    ChatEntry chatEntry,
    int? batchId,
  );
}

/// See also [HunterChatScreenNotifier].
@ProviderFor(HunterChatScreenNotifier)
const hunterChatScreenNotifierProvider = HunterChatScreenNotifierFamily();

/// See also [HunterChatScreenNotifier].
class HunterChatScreenNotifierFamily
    extends Family<AsyncValue<ChatScreenState>> {
  /// See also [HunterChatScreenNotifier].
  const HunterChatScreenNotifierFamily();

  /// See also [HunterChatScreenNotifier].
  HunterChatScreenNotifierProvider call(
    ChatEntry chatEntry,
    int? batchId,
  ) {
    return HunterChatScreenNotifierProvider(
      chatEntry,
      batchId,
    );
  }

  @override
  HunterChatScreenNotifierProvider getProviderOverride(
    covariant HunterChatScreenNotifierProvider provider,
  ) {
    return call(
      provider.chatEntry,
      provider.batchId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'hunterChatScreenNotifierProvider';
}

/// See also [HunterChatScreenNotifier].
class HunterChatScreenNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<HunterChatScreenNotifier,
        ChatScreenState> {
  /// See also [HunterChatScreenNotifier].
  HunterChatScreenNotifierProvider(
    ChatEntry chatEntry,
    int? batchId,
  ) : this._internal(
          () => HunterChatScreenNotifier()
            ..chatEntry = chatEntry
            ..batchId = batchId,
          from: hunterChatScreenNotifierProvider,
          name: r'hunterChatScreenNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hunterChatScreenNotifierHash,
          dependencies: HunterChatScreenNotifierFamily._dependencies,
          allTransitiveDependencies:
              HunterChatScreenNotifierFamily._allTransitiveDependencies,
          chatEntry: chatEntry,
          batchId: batchId,
        );

  HunterChatScreenNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatEntry,
    required this.batchId,
  }) : super.internal();

  final ChatEntry chatEntry;
  final int? batchId;

  @override
  FutureOr<ChatScreenState> runNotifierBuild(
    covariant HunterChatScreenNotifier notifier,
  ) {
    return notifier.build(
      chatEntry,
      batchId,
    );
  }

  @override
  Override overrideWith(HunterChatScreenNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: HunterChatScreenNotifierProvider._internal(
        () => create()
          ..chatEntry = chatEntry
          ..batchId = batchId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatEntry: chatEntry,
        batchId: batchId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<HunterChatScreenNotifier,
      ChatScreenState> createElement() {
    return _HunterChatScreenNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HunterChatScreenNotifierProvider &&
        other.chatEntry == chatEntry &&
        other.batchId == batchId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatEntry.hashCode);
    hash = _SystemHash.combine(hash, batchId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HunterChatScreenNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<ChatScreenState> {
  /// The parameter `chatEntry` of this provider.
  ChatEntry get chatEntry;

  /// The parameter `batchId` of this provider.
  int? get batchId;
}

class _HunterChatScreenNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<HunterChatScreenNotifier,
        ChatScreenState> with HunterChatScreenNotifierRef {
  _HunterChatScreenNotifierProviderElement(super.provider);

  @override
  ChatEntry get chatEntry =>
      (origin as HunterChatScreenNotifierProvider).chatEntry;
  @override
  int? get batchId => (origin as HunterChatScreenNotifierProvider).batchId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
