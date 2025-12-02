import 'package:flutter/foundation.dart';

class UserAccount {
  final String name;
  final String email;

  UserAccount({
    required this.name,
    required this.email,
  });
}

/// Very simple in-memory auth model:
/// - stores name + password for each email
/// - tracks a single "current user" for this session
class AuthModel extends ChangeNotifier {
  AuthModel._internal();
  static final AuthModel _instance = AuthModel._internal();

  factory AuthModel() => _instance;

  final Map<String, String> _passwords = {};
  final Map<String, String> _names = {};

  UserAccount? _currentUser;

  UserAccount? get currentUser => _currentUser;
  bool get isSignedIn => _currentUser != null;

  void register({
    required String name,
    required String email,
    required String password,
  }) {
    final trimmedEmail = email.trim().toLowerCase();
    final trimmedName = name.trim();

    if (trimmedName.isEmpty || trimmedEmail.isEmpty || password.isEmpty) {
      throw Exception('Please fill in all the fields.');
    }

    if (_passwords.containsKey(trimmedEmail)) {
      throw Exception('An account already exists for this email.');
    }

    _passwords[trimmedEmail] = password;
    _names[trimmedEmail] = trimmedName;

    _currentUser = UserAccount(name: trimmedName, email: trimmedEmail);
    notifyListeners();
  }

  void signIn({
    required String email,
    required String password,
  }) {
    final trimmedEmail = email.trim().toLowerCase();

    if (trimmedEmail.isEmpty || password.isEmpty) {
      throw Exception('Please enter your email and password.');
    }

    final storedPassword = _passwords[trimmedEmail];
    if (storedPassword == null || storedPassword != password) {
      throw Exception('Invalid email or password.');
    }

    final name = _names[trimmedEmail] ?? 'Student';
    _currentUser = UserAccount(name: name, email: trimmedEmail);
    notifyListeners();
  }

  void signOut() {
    _currentUser = null;
    notifyListeners();
  }
}
