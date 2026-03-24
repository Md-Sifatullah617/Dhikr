// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dhikr_counter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DhikrCounter)
final dhikrCounterProvider = DhikrCounterProvider._();

final class DhikrCounterProvider
    extends $NotifierProvider<DhikrCounter, DhikrCounterState> {
  DhikrCounterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dhikrCounterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dhikrCounterHash();

  @$internal
  @override
  DhikrCounter create() => DhikrCounter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DhikrCounterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DhikrCounterState>(value),
    );
  }
}

String _$dhikrCounterHash() => r'5f9bb95f6ead6ec116dea2faaff8d15f8d66245c';

abstract class _$DhikrCounter extends $Notifier<DhikrCounterState> {
  DhikrCounterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DhikrCounterState, DhikrCounterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DhikrCounterState, DhikrCounterState>,
              DhikrCounterState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(globalCount)
final globalCountProvider = GlobalCountProvider._();

final class GlobalCountProvider
    extends $FunctionalProvider<AsyncValue<int>, int, Stream<int>>
    with $FutureModifier<int>, $StreamProvider<int> {
  GlobalCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'globalCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$globalCountHash();

  @$internal
  @override
  $StreamProviderElement<int> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<int> create(Ref ref) {
    return globalCount(ref);
  }
}

String _$globalCountHash() => r'cf7cd65b1c88a49a03cc91882e16e44b1fcad78a';

@ProviderFor(VoiceMode)
final voiceModeProvider = VoiceModeProvider._();

final class VoiceModeProvider extends $NotifierProvider<VoiceMode, bool> {
  VoiceModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'voiceModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$voiceModeHash();

  @$internal
  @override
  VoiceMode create() => VoiceMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$voiceModeHash() => r'fd79a85471245d8a00169d52d102701a7b6541fd';

abstract class _$VoiceMode extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
