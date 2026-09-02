import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:motorsocial/motorsocial/features/auth/pages/login_page.dart';

void main() {
  testWidgets('LoginPage renders FilledButton and input fields',
      (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: LoginPage(),
        ),
      ),
    );

    expect(find.text('Iniciar sesión'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    // Regla M3: FilledButton en lugar de ElevatedButton.
    expect(find.byType(FilledButton), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Entrar'), findsOneWidget);
    // Asegura que no quedan ElevatedButton (M2).
    expect(find.byType(ElevatedButton), findsNothing);
  });

  testWidgets('LoginPage displays error message on empty credentials',
      (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: LoginPage(),
        ),
      ),
    );

    // Pulsar Entrar sin escribir credenciales.
    await tester.tap(find.widgetWithText(FilledButton, 'Entrar'));
    await tester.pump(const Duration(milliseconds: 700));

    expect(find.text('Credenciales inválidas'), findsOneWidget);
  });
}
