// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CartProduct {
  num product_id;
  num user_id;
  String com_name;
  String manufacturer;
  String image;
  num price;
  num quantity;
  CartProduct({
    required this.product_id,
    required this.user_id,
    required this.com_name,
    required this.manufacturer,
    required this.image,
    required this.price,
    required this.quantity,
  });


  CartProduct copyWith({
    num? product_id,
    num? user_id,
    String? com_name,
    String? manufacturer,
    String? image,
    num? price,
    num? quantity,
  }) {
    return CartProduct(
      product_id: product_id ?? this.product_id,
      user_id: user_id ?? this.user_id,
      com_name: com_name ?? this.com_name,
      manufacturer: manufacturer ?? this.manufacturer,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_id': product_id,
      'user_id': user_id,
      'com_name': com_name,
      'manufacturer': manufacturer,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }

  factory CartProduct.fromMap(Map<String, dynamic> map) {
    return CartProduct(
      product_id: map['product_id'] as num,
      user_id: map['user_id'] as num,
      com_name: map['com_name'] as String,
      manufacturer: map['manufacturer'] as String,
      image: map['image'] as String,
      price: map['price'] as num,
      quantity: map['quantity'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProduct.fromJson(String source) => CartProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartProduct(product_id: $product_id, user_id: $user_id, com_name: $com_name, manufacturer: $manufacturer, image: $image, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant CartProduct other) {
    if (identical(this, other)) return true;
  
    return 
      other.product_id == product_id &&
      other.user_id == user_id &&
      other.com_name == com_name &&
      other.manufacturer == manufacturer &&
      other.image == image &&
      other.price == price &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return product_id.hashCode ^
      user_id.hashCode ^
      com_name.hashCode ^
      manufacturer.hashCode ^
      image.hashCode ^
      price.hashCode ^
      quantity.hashCode;
  }
}
