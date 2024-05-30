import 'package:admin/models/product.dart';

class OrderModel{
  OrderModel({
    required this.totalPrice,
    required this.orderId,
    required this.payment,
    required this.products,
    required this.status,
  });
  String payment;
  String status;

  List<ProductModel> products;
  double totalPrice;
  String orderId;

  factory OrderModel.fromJson(Map<String, dynamic> json){
  List<dynamic> productMap = json["products"];
  return OrderModel(
    orderId: json["orderId"],
    products:productMap.map((e) => ProductModel.fromJson(e)).toList(),
    totalPrice: json["totalePrice"],
    status: json["payment"], payment: '');
  }
}