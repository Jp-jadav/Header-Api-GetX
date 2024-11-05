import 'package:get/get.dart';
import 'package:http_header/model/user_model.dart';

class ApiServices extends GetConnect {
  Future<UserModel?> getUserDetails() async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTczMDc5MjUyNywiZXhwIjoxNzMyNTIwNTI3fQ.0rvJ1unJkNtTovw4Un4U4ckqMbh63UmIxuqDnNGu-UQ";
    var uri = "https://api.escuelajs.co/api/v1/auth/profile";

    var response = await get(uri, headers: {"Authorization": "Bearer $token"});

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
