class PaymentModel {
  final int? id;
  final String? name;
  final String? code;
  final String? thumbnail;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? time;

  PaymentModel({
    this.id,
    this.name,
    this.code,
    this.thumbnail,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.time
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      PaymentModel(
        id: json['id'],
        name: json['name'],
        code: json['code'],
        thumbnail: json['thumbnail'],
        status: json['status'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        time: json['time']
      );
}
