import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/Firebase/Auth/auth_state.dart';

final authProvider = StateNotifierProvider(
  (_) => AuthenticationState(),
);
