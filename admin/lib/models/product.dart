// product.dart

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  String id;
  String name;
  double price;
  int quantity;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }
}
