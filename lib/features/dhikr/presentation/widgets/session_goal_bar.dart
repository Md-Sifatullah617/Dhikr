import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/colors.gen.dart';
import '../../providers/dhikr_counter_provider.dart';

class SessionGoalBar extends ConsumerWidget {
  const SessionGoalBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dhikrCounterProvider);

    return Row(
      mainAxisAlignment: .spaceBetween,
      crossAxisAlignment: .end,
      children: [
        Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          spacing: 4.h,
          children: [
            Text(
              'SESSION GOAL',
              style: TextStyle(
                color: ColorName.textPrimary.withValues(alpha: 0.5),
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                letterSpacing: 1.8,
              ),
            ),
            Text(
              '${state.currentCount} / ${state.targetCount}',
              style: TextStyle(
                color: ColorName.textPrimary,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          '${state.progressPercent}% COMPLETE',
          style: TextStyle(
            color: ColorName.accent,
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
