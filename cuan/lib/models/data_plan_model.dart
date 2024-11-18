class DataProviderModel {
  final int? id;
  final String? name;
  final String? status;
  final String? thumbnail;
  final List<DataPlanModel>? dataPlans;
  DataProviderModel({this.id, this.name, this.status, this.thumbnail, this.dataPlans});

  factory DataProviderModel.fromJson(Map<String, dynamic> json) {
    return DataProviderModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        thumbnail: json['thumbnail'],
        dataPlans: json['data_plans'] != null
            ? (json['data_plans'] as List).map((dataPlan) => DataPlanModel.fromJson(dataPlan)).toList()
            : null);
  }
}

class DataPlanModel {
  final int? id;
  final String? name;
  final int? price;
  DataPlanModel({this.id, this.name, this.price});

  factory DataPlanModel.fromJson(Map<String, dynamic> json) {
    return DataPlanModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}

class DataFormModel {
  final String? dataPlanId;
  final String? phoneNumber;
  final String? pin;

  DataFormModel({this.dataPlanId, this.phoneNumber, this.pin});
  Map<String, dynamic> toJson() => {
        'data_plan_id': dataPlanId,
        'phone_number': phoneNumber,
        'pin': pin,
      };
}
