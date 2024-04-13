sealed class AuthState {
  AuthState();
}

class AuthInitialState extends AuthState {
  AuthInitialState();
}

class AuthLoadingState extends AuthState {
  AuthLoadingState();
}

class AuthLoadedState extends AuthState {
  AuthLoadedState();
}

class AuthErrorState extends AuthState {
  AuthErrorState();
}
