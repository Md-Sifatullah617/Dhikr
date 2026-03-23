import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DhikrCounterScreen extends StatelessWidget {
  const DhikrCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B3A4B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B3A4B),
        foregroundColor: Colors.white,
        title: Text(
          'Dhikr Counter',
          style: TextStyle(fontSize: 18.sp),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'Counter screen — coming soon',
          style: TextStyle(color: Colors.white70, fontSize: 14.sp),
        ),
      ),
    );
  }
}
