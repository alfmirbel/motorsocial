import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/social_user.dart';

abstract class UsersRepository {
  Future<SocialUser?> findByEmail(String email);
  Future<void> save(SocialUser user);
}

class InMemoryUsersRepository implements UsersRepository {
  @override Future<SocialUser?> findByEmail(String email) async => null;
  @override Future<void> save(SocialUser user) async {}
}

final usersRepositoryProvider = Provider<UsersRepository>((ref) => InMemoryUsersRepository());
