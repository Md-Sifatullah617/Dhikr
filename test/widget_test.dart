import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dhikr/app.dart';

void main() {
  testWidgets('App smoke test — splash screen renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: App()),
    );
    await tester.pump();

    expect(find.text('Dhikr'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 2600));
    await tester.pumpAndSettle();
  });
}
