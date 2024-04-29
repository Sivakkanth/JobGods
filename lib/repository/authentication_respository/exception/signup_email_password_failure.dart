class SignUpWithEmailAndPasswordFailture {
  final String message;
  const SignUpWithEmailAndPasswordFailture(
      [this.message = "An Unknown error occured."]);
  factory SignUpWithEmailAndPasswordFailture.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailture(
            'Please enter a Strong Password.');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailture(
            'Email is not valid or badly formatted.');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailture(
            'An Account already exists for that email.');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailture(
            'Operaton is not allowed. Please contact support');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailture(
            'This user has been disabled. PLease contact support for help.');
      default:
        return const SignUpWithEmailAndPasswordFailture();
    }
  }
}
