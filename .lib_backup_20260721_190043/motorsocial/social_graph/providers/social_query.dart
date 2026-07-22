import 'package:flutter_riverpod/flutter_riverpod.dart';

class SocialQuery { const SocialQuery(); }

final socialQueryProvider = Provider<SocialQuery>((_) => const SocialQuery());
