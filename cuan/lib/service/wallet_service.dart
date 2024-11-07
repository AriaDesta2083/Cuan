import 'dart:convert';

import 'package:cuan/service/auth_service.dart';
import 'package:cuan/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class WalletServices {
  Future<void> updatePin(String oldPin, String newPin) async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.put(
        Uri.parse('$baseUrl/wallets'),
        body: {"previous_pin": oldPin, "new_pin": newPin}, headers: {'Authorization': 'Bearer $token'},
      );
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<int> getBalance() async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.get(Uri.parse('$baseUrl/wallets'), headers: {
        'Authorization': 'Bearer $token',
      });

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['balance'];
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
