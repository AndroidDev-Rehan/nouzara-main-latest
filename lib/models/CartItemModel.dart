class CartItemModel {
  CartItemModel({
    this.productId,
    this.title,
    this.quantity,
    this.variant,
    this.image,
    this.color,
    this.price,
  });

  int? productId;
  String? title;
  int? quantity;
  String? variant;
  String? image;
  String? color;
  var price;

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        productId: json["productId"],
        title: json["title"],
        quantity: json["quantity"],
        variant: json["variant"],
        image: json["image"],
        color: json["color"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "title": title,
        "quantity": quantity,
        "variant": variant,
        "image": image,
        "color": color,
        "price": price,
      };
}
