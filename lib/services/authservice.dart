import 'package:shared_preferences/shared_preferences.dart';

class Authservice {
  static final Authservice _instance = Authservice._init();
  static Authservice get instance => _instance;
  SharedPreferences? _pref;
  Authservice._init();

  Future<void> getSharePref() async {
    _pref ??= await SharedPreferences.getInstance();
  }

  Future<void> signUp(String email, String password) async {
    await _pref!.setString('email', email);
    await _pref!.setString('password', password);
  }

  String? getemail() {
    return _pref?.getString('email');
  }

  String? getpassword() {
    return _pref?.getString('password');
  }

  Future<void> isLogined(bool value) async {
    await _pref!.setBool('isLogin', value);
  }

  bool getLogindata() {
    return _pref?.getBool('isLogin') ?? false;
  }

  Future<void> logOut() async {
    await _pref!.clear();
  }
}
