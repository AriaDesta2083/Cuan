import 'dart:convert';
import 'package:cuan/models/data_plan_model.dart';
import 'package:cuan/models/topup_model.dart';
import 'package:cuan/models/transaction_model.dart';
import 'package:cuan/models/transfer_model.dart';
import 'package:cuan/service/auth_service.dart';
import 'package:cuan/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TransactionServices {
  Future<String> topUp(TopUpModel data) async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.post(Uri.parse('$baseUrl/top_ups'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: data.toJson());
      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> transfer(TransferModel data) async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.post(Uri.parse('$baseUrl/transfers'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: data.toJson());
      if (res.statusCode != 200) {
        return jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  
  Future<void> buyData(DataFormModel data) async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.post(Uri.parse('$baseUrl/data_plans'),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: data.toJson());
      if (res.statusCode != 200) {
        return jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }



  Future<List<TransactionModel>> getTransaction(int? limit) async {
    try {
      
      final token = await AuthServices().getToken();
      final res = await http.get(
        Uri.parse('$baseUrl/transactions?limit=${((limit==0) ? 50:limit)}'),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (res.statusCode == 200) {
        return List<TransactionModel>.from(jsonDecode(res.body)['data'].map((data) => TransactionModel.fromJson(data)))
            .toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
  
}
