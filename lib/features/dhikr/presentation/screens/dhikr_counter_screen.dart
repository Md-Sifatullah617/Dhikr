import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/colors.gen.dart';
import '../../providers/dhikr_counter_provider.dart';
import '../widgets/dhikr_circle.dart';
import '../widgets/session_goal_bar.dart';
import '../widgets/voice_toggle_button.dart';

class DhikrCounterScreen extends ConsumerStatefulWidget {
  const DhikrCounterScreen({super.key});

  @override
  ConsumerState<DhikrCounterScreen> createState() => _DhikrCounterScreenState();
}

class _DhikrCounterScreenState extends ConsumerState<DhikrCounterScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(dhikrCounterProvider.select((s) => s.isCompleted), (
      prev,
      next,
    ) {
      if (next && prev == false) {
        Future.delayed(
          const Duration(milliseconds: 400),
          _showCompletionDialog,
        );
      }
    });

    final isVoice = ref.watch(voiceModeProvider);
    final globalCount = ref.watch(globalCountProvider);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _showExitDialog();
      },
      child: Scaffold(
        backgroundColor: ColorName.screenBg,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: .center,
              children: [
                SizedBox(height: 12.h),

                // ── Custom App Bar ────────────────────────────────────────
                Row(
                  spacing: 14.w,
                  children: [
                    GestureDetector(
                      onTap: _showExitDialog,
                      child: Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorName.backButtonBg,
                          border: Border.all(
                            color: ColorName.textSecondary.withValues(
                              alpha: 0.5,
                            ),
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.chevron_left_rounded,
                          color: ColorName.textPrimary,
                          size: 22.sp,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          'Dhikr',
                          style: TextStyle(
                            color: ColorName.textPrimary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'JOINED',
                          style: TextStyle(
                            color: ColorName.accent.withValues(alpha: 0.7),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 24.h),

                // ── Global Live Count ─────────────────────────────────────
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(
                      color: ColorName.textSecondary.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: .min,
                    spacing: 8.w,
                    children: [
                      Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorName.liveGreen,
                          boxShadow: [
                            BoxShadow(
                              color: ColorName.liveGreen.withValues(alpha: 0.5),
                              blurRadius: 6,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'GLOBAL LIVE COUNT',
                        style: TextStyle(
                          color: ColorName.accent.withValues(alpha: 0.7),
                          fontSize: 11.sp,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 12.h),

                globalCount.when(
                  data: (count) => _GlobalCountDisplay(count: count),
                  loading: () => _GlobalCountDisplay(count: 2841092),
                  error: (_, _) => const SizedBox.shrink(),
                ),

                const Spacer(),

                // ── Dhikr Circle ──────────────────────────────────────────
                const DhikrCircle(),

                const Spacer(),

                // ── TAP / SPEAK TO RECITE ─────────────────────────────────
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    isVoice ? 'SPEAK TO RECITE' : 'TAP TO RECITE',
                    key: ValueKey(isVoice),
                    style: TextStyle(
                      color: ColorName.accent.withValues(alpha: 0.7),
                      fontSize: 12.sp,
                      letterSpacing: 3,
                    ),
                  ),
                ),

                SizedBox(height: 16.h),

                // ── Change to Voice button ────────────────────────────────
                const VoiceToggleButton(),

                SizedBox(height: 24.h),

                // ── Session Goal Bar ──────────────────────────────────────
                const SessionGoalBar(),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showExitDialog() {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: ColorName.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          'Leave Dhikr?',
          style: TextStyle(
            color: ColorName.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Are you sure you want to exit?',
          style: TextStyle(color: ColorName.textSecondary, fontSize: 14.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Stay',
              style: TextStyle(color: ColorName.textSecondary, fontSize: 14.sp),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              SystemNavigator.pop();
            },
            child: Text(
              'Exit',
              style: TextStyle(
                color: ColorName.accent,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCompletionDialog() {
    if (!mounted) return;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: ColorName.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: ColorName.accent,
              size: 64.r,
            ),
            SizedBox(height: 16.h),
            Text(
              'Completed!',
              style: TextStyle(
                color: ColorName.textPrimary,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'الحمد لله',
              textDirection: TextDirection.rtl,
              style: TextStyle(color: ColorName.accent, fontSize: 20.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              'Alhamdulillah',
              style: TextStyle(
                color: ColorName.textSecondary,
                fontSize: 13.sp,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 28.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorName.accent,
                  foregroundColor: ColorName.screenBg,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  ref.read(dhikrCounterProvider.notifier).reset();
                },
                child: Text(
                  'Reset & Continue',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlobalCountDisplay extends StatelessWidget {
  final int count;

  const _GlobalCountDisplay({required this.count});

  String _format(int n) {
    // e.g. 2841092 → "2,841,092"
    final s = n.toString();
    final buf = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
      buf.write(s[i]);
    }
    return buf.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4.h,
      children: [
        Text(
          _format(count),
          style: TextStyle(
            color: ColorName.textPrimary,
            fontSize: 38.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
          ),
        ),
        Text(
          'TOTAL RECITATIONS TODAY',
          style: TextStyle(
            color: ColorName.accent.withValues(alpha: 0.7),
            fontSize: 11.sp,
            letterSpacing: 3,
          ),
        ),
      ],
    );
  }
}
