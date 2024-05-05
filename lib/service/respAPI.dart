import 'dart:convert';
import 'package:http/http.dart';

Future<bool> login(String phoneNumber) async {
  try {
    Response response = await post(
        Uri.parse('http://devapiv3.dealsdray.com/api/v2/user/otp'),
        body: {
          {"mobileNumber": phoneNumber, "deviceId": "62b341aeb0ab5ebe28a758a3"}
        });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data['token']);
      print('Login successfully');
      return true;
    } else {
      print('failed');
      return false;
    }
  } catch (e) {
    print(e.toString());
    return false;
  }
}
