import 'dart:convert';
import 'package:cuan/models/payment_model.dart';
import 'package:cuan/service/auth_service.dart';
import 'package:cuan/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class PaymentMethodService {
  Future<List<PaymentModel>> getListPaymentMethod() async {
    try {
      final token = await AuthServices().getToken();
      final res = await http.get(Uri.parse('$baseUrl/payment_methods'), headers: {
        'Authorization': 'Bearer $token',
      });

      if (res.statusCode == 200) {
        List<PaymentModel> listPaymentMethod =
            List<PaymentModel>.from(jsonDecode(res.body).map((data) => PaymentModel.fromJson(data)))
                .toList();
        return listPaymentMethod;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }


}
