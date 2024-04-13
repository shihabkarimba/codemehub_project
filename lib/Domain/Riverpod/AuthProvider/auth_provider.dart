import 'package:codemehub_project/Widgets/toast_message.dart';

import '../../Repo/AuthRepo/auth_repo.dart';
import 'auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider =
    NotifierProvider<AuthNotifier, AuthState>(() => AuthNotifier());

class AuthNotifier extends Notifier<AuthState> {
  final firebaseService = FirebaseAuthService();

  @override
  AuthState build() {
    return AuthInitialState();
  }

  Future<bool?> loginUser(String email, String password) async {
    state = AuthLoadingState();
    final user =
        await firebaseService.signInWithEmailAndPassword(email, password);
    if (user == null) {
      state = AuthErrorState();
      showSnackBar(msg: 'Invalid Credentials');
    }
    if (user != null) {
      state = AuthLoadedState();
      return true;
    }
    state = AuthInitialState();
    return null;
  }

  Future<bool?> signUpUser(
      {required String email, required String password}) async {
    state = AuthLoadingState();
    final user =
        await firebaseService.signUpWithEmailAndPassword(email, password);
    if (user == null) {
      state = AuthErrorState();
      showSnackBar(msg: 'Invalid Credentials');
      return null;
    }
    state = AuthLoadedState();
    return true;
  }
}
