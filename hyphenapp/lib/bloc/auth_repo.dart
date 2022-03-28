class AuthRepo {
  Future<void> login() async {
    print('attempting to login');
    Future.delayed(Duration(seconds: 2));
    print('logged in');
  }
}
