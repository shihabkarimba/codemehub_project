import '../../Repo/Auth/auth_repo.dart';
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

  Future<void> loginUser(String email, String password) async {
    print('object');
    state = AuthLoadingState();
    final user =
        await firebaseService.signInWithEmailAndPassword(email, password);
    if (user == null) {
      state = AuthErrorState();
    }
    state = AuthLoadedState();
  }
}
