import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/colors.gen.dart';
import '../../providers/dhikr_counter_provider.dart';

class VoiceToggleButton extends ConsumerWidget {
  const VoiceToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVoice = ref.watch(voiceModeProvider);

    return GestureDetector(
      onTap: () => ref.read(voiceModeProvider.notifier).toggle(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: ColorName.accentLight.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisSize: .min,
          spacing: 10.w,
          children: [
            Icon(Icons.swap_horiz_rounded, color: ColorName.accent, size: 18.r),
            Text(
              isVoice ? 'CHANGE TO TAP' : 'CHANGE TO VOICE',
              style: TextStyle(
                color: ColorName.accent,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
