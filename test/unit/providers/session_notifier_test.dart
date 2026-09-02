import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:motorsocial/motorsocial/core/providers/app_providers.dart';

void main() {
  group('SessionNotifier', () {
    test('inicia con mapa vacío', () {
      final container = ProviderContainer();
      final session = container.read(sessionProvider);
      expect(session, isEmpty);
    });

    test('setSession actualiza el estado', () {
      final container = ProviderContainer();
      final notifier = container.read(sessionProvider.notifier);

      notifier.setSession(<String, String?>{
        'token': 'jwt-fake-123',
        'userId': 'user-1',
      });

      final session = container.read(sessionProvider);
      expect(session['token'], 'jwt-fake-123');
      expect(session['userId'], 'user-1');
    });

    test('setSession reemplaza valores previos', () {
      final container = ProviderContainer();
      final notifier = container.read(sessionProvider.notifier);

      notifier.setSession(<String, String?>{'token': 'old-token'});
      notifier.setSession(<String, String?>{'token': 'new-token'});

      expect(container.read(sessionProvider)['token'], 'new-token');
    });

    test('setSession con mapa vacío limpia el estado', () {
      final container = ProviderContainer();
      container.read(sessionProvider.notifier).setSession(<String, String?>{
        'token': 'token-to-clear',
      });
      container.read(sessionProvider.notifier).setSession(<String, String?>{});

      expect(container.read(sessionProvider), isEmpty);
    });
  });
}
