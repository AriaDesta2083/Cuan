import 'dart:convert';
import 'package:cuan/models/signin_form_model.dart';
import 'package:cuan/models/signup_form_model.dart';
import 'package:cuan/models/update_user_form_model.dart';
import 'package:cuan/models/user_model.dart';
import 'package:cuan/shared/shared_values.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/is-email-exist'),
        body: {'email': email},
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      } else {
        throw jsonDecode(res.body)['errors']?['email']?[0] ??  jsonDecode(res.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(SignUpFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/register'),
        body: data.toJson(),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final user = userModelFromJson(res.body);
        user.password = data.password;

        await storeCredentialToLocal(user);
        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<UserModel> login(SignInFormModel data) async {
    try {
      final res = await http.post(Uri.parse('$baseUrl/login'), body: data.toJson());
      if (res.statusCode == 200) {
        final user = userModelFromJson(res.body);
        user.password = data.password;
        await storeCredentialToLocal(user);
        return user;
      } else {
        throw jsonDecode(res.body)['message'] ?? jsonDecode(res.body)['errors']?['email']?[0];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredentialToLocal(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';
    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');
    if (value!=null) {
      token = value;
    }
    print('get token ${token.substring(1,20)}');
    return token;
  }

  Future<SignInFormModel> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, dynamic> value = await storage.readAll();
      if (value['token'] != null) {
        final SignInFormModel data = SignInFormModel(email: value['email'], password: value['password']);
        print('get user from local ${data.toJson()}');
        return data;
      } else {
        throw 'unauthenticated';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> clearStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
    print('succes clear storage');
  }


  Future<void> updateUser(UpdateUserFormModel user) async {
    try {
      final token = await getToken();
      final res = await http.put(Uri.parse('$baseUrl/users'), headers: {
        'Authorization': "Bearer $token",
      },body: user.toJson());
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      final token = await getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/logout'),
        headers: {
          'Authorization': "Bearer $token",
        },
      );
      if (res.statusCode == 200) {
        await clearStorage();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
