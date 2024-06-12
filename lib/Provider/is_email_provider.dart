import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/Firebase/Auth/auth_provider.dart';

final emailVerifyPro = Provider((ref) {
  final state = ref.watch(authProvider);
  return state;
},);