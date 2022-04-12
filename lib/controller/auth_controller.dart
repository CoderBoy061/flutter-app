// ignore: camel_case_types
// ignore_for_file: camel_case_types

import 'package:dio/dio.dart';

class auth_Controller {
  var dio = Dio();
  Future<String> signupUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty) {
        return "Please fill all the fields";
      }
      if (password.length < 6) {
        return "Password must be atleast 6 characters long";
      }
      if (phone.length != 10) {
        return "Phone number must be 10 digits long";
      } else {
        var response =
            await dio.post("http://localhost:5000/api/v1/register", data: {
          "name": name,
          "email": email,
          "phone": phone,
          "password": password,
        });
        if (response.statusCode == 201) {
          return "Successfully registered";
        } else {
          return "Something went wrong";
        }
      }
    } catch (err) {
      return err.toString();
    }
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        return "Please fill all the fields";
      } else {
        var response = await dio.post("http://localhost:5000/api/v1/login",
            data: {"email": email, "password": password});
        if (response.statusCode == 200) {
          return "Successfully logged in";
        } else {
          return "Something went wrong";
        }
      }
    } catch (err) {
      return err.toString();
    }
  }
}
