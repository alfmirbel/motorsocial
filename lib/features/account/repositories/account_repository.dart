import '../../../../identity/identity.dart';
import '../../../../identity/data_models/social_user.dart';

abstract class AccountRepository {
  Future<int> createAccount(SocialUser user, String secret);
  Future<SocialUser?> getAccount(String userId);
  Future<int> updateAccount(SocialUser user);
  Future<int> deleteAccount(String userId);
}
