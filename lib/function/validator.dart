import 'package:mynote/database/user.dart';
  bool validate(String email, String password) {
    final userinfo=userdata();
    var data = userinfo.user.where(
      (v) => v["name"] == email && v["pass"] == password,
    );
    if (data.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
