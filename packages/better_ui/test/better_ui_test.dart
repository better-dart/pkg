import 'package:better_ui/better_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () {
    expect(3, 3);
  });

  // widget test:
  testWidgets('test view:', (WidgetTester tester) async {
    // Test code goes here.
    await tester.pumpWidget(
      MaterialApp(
        home: ui.buildStdView(
          title: Text('test1'),
          titleText: 'test',
          body: Container(
            child: Text('test'),
          ),
        ),
      ),
    );

    // expect:
    expect(find.text('test1'), findsOneWidget);
    expect(find.text('test'), findsWidgets);
  });
}
