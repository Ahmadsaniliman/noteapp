import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/Firebase/Auth/auth_provider.dart';

final userIdProvider = Provider(
  (ref) {
    final authState = ref.watch(authProvider);
    return authState.userId;
  },
);
