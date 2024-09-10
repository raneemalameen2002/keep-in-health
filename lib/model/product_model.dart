// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  String com_name;
  String manufacturer;
  String image;
  num id;
  num price;
  ProductModel({
    required this.com_name,
    required this.manufacturer,
    required this.image,
    required this.id,
    required this.price,
  });

  ProductModel copyWith({
    String? com_name,
    String? manufacturer,
    String? image,
    num? id,
    num? price,
  }) {
    return ProductModel(
      com_name: com_name ?? this.com_name,
      manufacturer: manufacturer ?? this.manufacturer,
      image: image ?? this.image,
      id: id ?? this.id,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'com_name': com_name,
      'manufacturer': manufacturer,
      'image': image,
      'id': id,
      'price': price,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      com_name: map['com_name'] as String,
      manufacturer: map['manufacturer'] as String,
      image: map['image'] as String,
      id: map['id'] as num,
      price: map['price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(com_name: $com_name, manufacturer: $manufacturer, image: $image, id: $id, price: $price)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.com_name == com_name &&
      other.manufacturer == manufacturer &&
      other.image == image &&
      other.id == id &&
      other.price == price;
  }

  @override
  int get hashCode {
    return com_name.hashCode ^
      manufacturer.hashCode ^
      image.hashCode ^
      id.hashCode ^
      price.hashCode;
  }
}
