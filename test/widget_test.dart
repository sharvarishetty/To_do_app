import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/main.dart';

void main() {
  testWidgets('Test if adding a task works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify that initially, there are no tasks
    expect(find.text('Example Task'), findsNothing);

    // Tap on the add button
    await tester.enterText(find.byType(TextField), 'Example Task');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the task has been added
    expect(find.text('Example Task'), findsOneWidget);
  });

  testWidgets('Test if marking a task as completed works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Tap on the add button
    await tester.enterText(find.byType(TextField), 'Example Task');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the task is not marked as completed initially
    expect(find.text('✓ Example Task'), findsNothing);

    // Tap on the task to mark it as completed
    await tester.tap(find.text('Example Task'));
    await tester.pump();

    // Verify that the task is marked as completed
    expect(find.text('✓ Example Task'), findsOneWidget);
  });

  testWidgets('Test if deleting a task works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Tap on the add button
    await tester.enterText(find.byType(TextField), 'Example Task');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the task exists
    expect(find.text('Example Task'), findsOneWidget);

    // Tap on the delete button
    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pump();

    // Verify that the task has been deleted
    expect(find.text('Example Task'), findsNothing);
  });
}
