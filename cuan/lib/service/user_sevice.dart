import 'dart:convert';

import 'package:cuan/models/user_model.dart';
import 'package:cuan/service/auth_service.dart';
import 'package:cuan/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class UserServices {
  Future<List<UserModel>> getUserByUsername(String username) async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.get(Uri.parse('$baseUrl/users/$username'), headers: {'Authorization': 'Bearer $token'});

      if (res.statusCode == 200) {
        return List<UserModel>.from(jsonDecode(res.body).map((data) => UserModel.fromJson(data))).toList();
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getRecentUser()async{
    try {
      final token = await AuthServices().getToken();
      final res = await http.get(Uri.parse('$baseUrl/transfer_histories'), headers: {'Authorization': 'Bearer $token'});

      if (res.statusCode == 200) {
        return List<UserModel>.from(jsonDecode(res.body)['data'].map((data) => UserModel.fromJson(data))).toList();
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
