class BillingModel {
  BillingModel({
    this.first_name,
    this.lastname,
    this.city,
    this.address,
    this.state,
    this.postcode,
    this.country,
    this.email,
    this.phone,
  });

  String? first_name;
  String? lastname;

  String? city;
  String? address;
  String? state;
  String? postcode;
  String? country;
  String? email;
  int? phone;

  factory BillingModel.fromJson(Map<String, dynamic> json) => BillingModel(
        first_name: json["first_name"],
        lastname: json["lastname"],
        city: json["city"],
        address: json["address"],
        state: json["state"],
        postcode: json["postcode"],
        country: json["country"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": first_name,
        "lastname": lastname,
        "city": city,
        "address": address,
        "state": state,
        "postcode": postcode,
        "country": country,
        "email": email,
        "phone": phone,
      };
}
