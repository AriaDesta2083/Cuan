import 'package:cuan/models/transaction_model.dart';
import 'package:cuan/shared/helper.dart';

Future<Map<String, List<TransactionModel>>> groupDataByKey(List<TransactionModel> data) async {
  Map<String, List<TransactionModel>> groupedData = {};

  for (var item in data) {
    String key = formatDate(date:DateTime.parse(item.createdAt!),formatDate: 'EEEE dd MMM'); // Menggunakan properti `key` dari `Model`
    if (groupedData.containsKey(key)) {
      groupedData[key]!.add(item); // Tambahkan item ke list yang sudah ada
    } else {
      groupedData[key] = [item]; // Buat entry baru jika key belum ada
    }
  }
  return groupedData;
}
