import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rpmlauncher/View/RowScrollView.dart';

import 'TestUttily.dart';

void main() {
  setUpAll(() => TestUttily.init());

  testWidgets("RowScrollView", (WidgetTester tester) async {
    await TestUttily.baseTestWidget(
      tester,
      RowScrollView(
        child: Row(
          children: List.generate(
              100,
              (index) => Column(
                    children: [
                      Text("Hello"),
                      Text("World"),
                    ],
                  )).toList(),
        ),
      ),
    );

    expect(find.text("Hello"), findsWidgets);
    expect(find.text("World"), findsWidgets);

    await tester.drag(find.text('Hello').first, const Offset(0.0, -300));
    await tester.pump();
  });
}