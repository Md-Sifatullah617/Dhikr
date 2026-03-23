import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dhikr/app.dart';
import 'package:dhikr/features/dhikr/providers/dhikr_counter_provider.dart';

void main() {
  testWidgets('App smoke test — splash screen renders', (WidgetTester tester) async {
    // Set portrait phone dimensions to match ScreenUtil design size
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // Replace the infinite stream with a single-value stream so no
          // pending timers remain after the test completes.
          globalCountProvider.overrideWith((_) => Stream.value(2841092)),
        ],
        child: const MyApp(),
      ),
    );
    await tester.pump();

    expect(find.text('Dhikr'), findsOneWidget);

    // Advance past the 2500ms navigation timer so no pending timers remain
    await tester.pump(const Duration(milliseconds: 2600));
    await tester.pumpAndSettle();
  });
}
