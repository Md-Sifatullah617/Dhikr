// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dhikr_counter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$globalCountHash() => r'433ad0694d73b361886c3552d312daa4d6ac0bd4';

/// See also [globalCount].
@ProviderFor(globalCount)
final globalCountProvider = AutoDisposeStreamProvider<int>.internal(
  globalCount,
  name: r'globalCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$globalCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GlobalCountRef = AutoDisposeStreamProviderRef<int>;
String _$dhikrCounterHash() => r'5f9bb95f6ead6ec116dea2faaff8d15f8d66245c';

/// See also [DhikrCounter].
@ProviderFor(DhikrCounter)
final dhikrCounterProvider =
    AutoDisposeNotifierProvider<DhikrCounter, DhikrCounterState>.internal(
      DhikrCounter.new,
      name: r'dhikrCounterProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dhikrCounterHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DhikrCounter = AutoDisposeNotifier<DhikrCounterState>;
String _$voiceModeHash() => r'fd79a85471245d8a00169d52d102701a7b6541fd';

/// See also [VoiceMode].
@ProviderFor(VoiceMode)
final voiceModeProvider = AutoDisposeNotifierProvider<VoiceMode, bool>.internal(
  VoiceMode.new,
  name: r'voiceModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$voiceModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VoiceMode = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
