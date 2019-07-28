// Esta es una prueba básica del widget Flutter.
//
// Para realizar una interacción con un widget en su prueba, use WidgetTester
// utilidad que proporciona Flutter. Por ejemplo, puedes enviar tap y desplazarte.
// gestos. También puede utilizar WidgetTester para encontrar widgets secundarios en el widget
// árbol, lea el texto y verifique que los valores de las propiedades del widget sean correctos.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:stateful_widget/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyButton());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
