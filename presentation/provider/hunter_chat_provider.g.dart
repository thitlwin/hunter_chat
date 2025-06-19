// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hunter_chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hunterChatHash() => r'fe62405234715cccd0de4fb6959c7ec3d9f78a4f';

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

abstract class _$HunterChat
    extends BuildlessAutoDisposeAsyncNotifier<List<ChatMessage?>> {
  late final String documentName;

  FutureOr<List<ChatMessage?>> build(
    String documentName,
  );
}

/// See also [HunterChat].
@ProviderFor(HunterChat)
const hunterChatProvider = HunterChatFamily();

/// See also [HunterChat].
class HunterChatFamily extends Family<AsyncValue<List<ChatMessage?>>> {
  /// See also [HunterChat].
  const HunterChatFamily();

  /// See also [HunterChat].
  HunterChatProvider call(
    String documentName,
  ) {
    return HunterChatProvider(
      documentName,
    );
  }

  @override
  HunterChatProvider getProviderOverride(
    covariant HunterChatProvider provider,
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
  String? get name => r'hunterChatProvider';
}

/// See also [HunterChat].
class HunterChatProvider extends AutoDisposeAsyncNotifierProviderImpl<
    HunterChat, List<ChatMessage?>> {
  /// See also [HunterChat].
  HunterChatProvider(
    String documentName,
  ) : this._internal(
          () => HunterChat()..documentName = documentName,
          from: hunterChatProvider,
          name: r'hunterChatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hunterChatHash,
          dependencies: HunterChatFamily._dependencies,
          allTransitiveDependencies:
              HunterChatFamily._allTransitiveDependencies,
          documentName: documentName,
        );

  HunterChatProvider._internal(
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
  FutureOr<List<ChatMessage?>> runNotifierBuild(
    covariant HunterChat notifier,
  ) {
    return notifier.build(
      documentName,
    );
  }

  @override
  Override overrideWith(HunterChat Function() create) {
    return ProviderOverride(
      origin: this,
      override: HunterChatProvider._internal(
        () => create()..documentName = documentName,
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
  AutoDisposeAsyncNotifierProviderElement<HunterChat, List<ChatMessage?>>
      createElement() {
    return _HunterChatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HunterChatProvider && other.documentName == documentName;
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
mixin HunterChatRef on AutoDisposeAsyncNotifierProviderRef<List<ChatMessage?>> {
  /// The parameter `documentName` of this provider.
  String get documentName;
}

class _HunterChatProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<HunterChat,
        List<ChatMessage?>> with HunterChatRef {
  _HunterChatProviderElement(super.provider);

  @override
  String get documentName => (origin as HunterChatProvider).documentName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
