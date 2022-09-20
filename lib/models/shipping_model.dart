class ShippingModel {
  ShippingModel({
    this.method_id,
    this.method_title,
    this.total,
  });

  int? method_id;
  String? method_title;

  double? total;

  factory ShippingModel.fromJson(Map<String, dynamic> json) => ShippingModel(
        method_id: json["method_id"],
        method_title: json["method_title"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "method_id": method_id,
        "method_title": method_title,
        "total": total,
      };
}
