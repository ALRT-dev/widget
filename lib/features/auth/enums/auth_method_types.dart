enum AuthMethod {
  phone,
  google,
  apple,
  email;

  String get logoPath {
    return switch (this) {
      AuthMethod.phone => '',
      AuthMethod.google => 'assets/logos/google.svg',
      AuthMethod.apple => 'assets/logos/apple.svg',
      AuthMethod.email => 'assets/logos/email.svg',
    };
  }
}
