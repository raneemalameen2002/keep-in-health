// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderProductModel {
  String com_name;
  String image;
  num quantity;
  num price;
  num product_id;
  OrderProductModel({
    required this.com_name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.product_id,
  });


  OrderProductModel copyWith({
    String? com_name,
    String? image,
    num? quantity,
    num? price,
    num? product_id,
  }) {
    return OrderProductModel(
      com_name: com_name ?? this.com_name,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      product_id: product_id ?? this.product_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'com_name': com_name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'product_id': product_id,
    };
  }

  factory OrderProductModel.fromMap(Map<String, dynamic> map) {
    return OrderProductModel(
      com_name: map['com_name'] as String,
      image: map['image'] as String,
      quantity: map['quantity'] as num,
      price: map['price'] as num,
      product_id: map['product_id'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderProductModel.fromJson(String source) => OrderProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderProductModel(com_name: $com_name, image: $image, quantity: $quantity, price: $price, product_id: $product_id)';
  }

  @override
  bool operator ==(covariant OrderProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.com_name == com_name &&
      other.image == image &&
      other.quantity == quantity &&
      other.price == price &&
      other.product_id == product_id;
  }

  @override
  int get hashCode {
    return com_name.hashCode ^
      image.hashCode ^
      quantity.hashCode ^
      price.hashCode ^
      product_id.hashCode;
  }
}
