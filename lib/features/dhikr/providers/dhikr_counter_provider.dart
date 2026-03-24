import 'dart:async';
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_constants.dart';
import '../models/dhikr_counter_state.dart';

part 'dhikr_counter_provider.g.dart';

@riverpod
class DhikrCounter extends _$DhikrCounter {
  @override
  DhikrCounterState build() => const DhikrCounterState(
        currentCount: 0,
        targetCount: 33,
      );

  void increment() {
    if (state.isCompleted) return;
    state = state.copyWith(currentCount: state.currentCount + 1);
  }

  void reset() {
    state = state.copyWith(currentCount: 0);
  }

  void setTarget(int target) {
    state = DhikrCounterState(currentCount: 0, targetCount: target);
  }
}

@riverpod
Stream<int> globalCount(Ref ref) async* {
  final rng = Random();
  var count = AppConstants.globalCountSeed;
  yield count;
  while (true) {
    // Wait 2–3 seconds between increments
    await Future<void>.delayed(
      Duration(milliseconds: 2000 + rng.nextInt(1000)),
    );
    count += 1 + rng.nextInt(4);
    yield count;
  }
}

@riverpod
class VoiceMode extends _$VoiceMode {
  @override
  bool build() => false;

  void toggle() => state = !state;
}
