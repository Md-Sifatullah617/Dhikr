class DhikrCounterState {
  final int currentCount;
  final int targetCount;

  const DhikrCounterState({
    required this.currentCount,
    required this.targetCount,
  });

  bool get isCompleted => currentCount >= targetCount;

  double get progress =>
      targetCount == 0 ? 0.0 : (currentCount / targetCount).clamp(0.0, 1.0);

  int get progressPercent => (progress * 100).toInt();

  DhikrCounterState copyWith({int? currentCount, int? targetCount}) {
    return DhikrCounterState(
      currentCount: currentCount ?? this.currentCount,
      targetCount: targetCount ?? this.targetCount,
    );
  }
}
