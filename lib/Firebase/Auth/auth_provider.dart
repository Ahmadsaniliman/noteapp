import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/AppState/app_state.dart';
import 'package:myfirstnotebook/Firebase/Auth/auth.dart';
import 'package:myfirstnotebook/Firebase/Auth/auth_state.dart';

final authProvider = StateNotifierProvider<AuthenticationState, FirebaseAuthenticator>(
  (_) => AuthenticationState(),
);
