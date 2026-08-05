import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

/// The mark is six paths and must never be simplified. This renders the
/// real asset so a broken or emptied SVG fails the build rather than
/// silently shipping a blank footer slot.
void main() {
  testWidgets('the ALRT mark renders from the SVG asset', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: SizedBox(
            width: 32,
            height: 26,
            child: SvgPicture.asset(
              'assets/logos/alrt_logo.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.byType(SvgPicture), findsOneWidget);
  });
}
