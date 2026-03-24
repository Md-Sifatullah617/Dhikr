import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../gen/colors.gen.dart';
import '../../providers/dhikr_counter_provider.dart';

class DhikrCircle extends ConsumerStatefulWidget {
  const DhikrCircle({super.key});

  @override
  ConsumerState<DhikrCircle> createState() => _DhikrCircleState();
}

class _DhikrCircleState extends ConsumerState<DhikrCircle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 90),
      reverseDuration: const Duration(milliseconds: 130),
    );
    _scale = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    final state = ref.read(dhikrCounterProvider);
    if (state.isCompleted) return;
    HapticFeedback.lightImpact();
    ref.read(dhikrCounterProvider.notifier).increment();
    _controller.forward().then((_) => _controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    final currentCount = ref.watch(
      dhikrCounterProvider.select((s) => s.currentCount),
    );

    return GestureDetector(
      onTap: _handleTap,
      child: ScaleTransition(
        scale: _scale,
        child: SizedBox(
          width: 0.75.sw,
          height: 0.75.sw,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outer ring with subtle gold border
              Container(
                width: 0.7.sw,
                height: 0.7.sw,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorName.circleInner,
                  border: Border.all(
                    color: ColorName.accent.withValues(alpha: 0.35),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorName.accent.withValues(alpha: 0.15),
                      blurRadius: 15,
                      spreadRadius: 7,
                    ),
                  ],
                ),
              ),

              // Inner circle with stronger gold border
              Container(
                width: 0.6.sw,
                height: 0.6.sw,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorName.circleInner,
                  border: Border.all(
                    color: ColorName.accent.withValues(alpha: 0.1),
                    width: 2,
                  ),
                ),
              ),

              // Content
              SizedBox(
                width: 0.6.sw,
                child: Column(
                  mainAxisSize: .min,
                  children: [
                    // Arabic calligraphy
                    Text(
                      AppConstants.dhikrName,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorName.accent,
                        fontSize: 45.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // SUBHANALLAH
                    Text(
                      AppConstants.dhikrTitle,
                      style: TextStyle(
                        color: ColorName.textPrimary,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 4.h),

                    // GLORY BE TO ALLAH
                    Text(
                      AppConstants.dhikrSubtitle,
                      style: TextStyle(
                        color: ColorName.accent.withValues(alpha: 0.6),
                        fontSize: 10.sp,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 10.h),

                    // Count
                    Text(
                      '$currentCount',
                      style: TextStyle(
                        color: ColorName.textPrimary,
                        fontSize: 48.sp,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
