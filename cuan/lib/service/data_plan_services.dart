import 'dart:convert';

import 'package:cuan/models/data_plan_model.dart';
import 'package:cuan/service/auth_service.dart';
import 'package:cuan/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class DataPlansServices {
  Future<List<DataProviderModel>> getDataProvier() async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.get(
          Uri.parse(
            '$baseUrl/operator_cards',
          ),
          headers: {'Authorization': 'Bearer $token'});
      if (res.statusCode == 200) {
        return List<DataProviderModel>.from(jsonDecode(res.body)['data'].map((data) => DataProviderModel.fromJson(data)))
            .toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
