// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductCategory {
  num id;
  String sci_name;
  String com_name;
  String manufacturer;
  String image;
  num quantity;
  String expiration_date;
  num price;
  ProductCategory({
    required this.id,
    required this.sci_name,
    required this.com_name,
    required this.manufacturer,
    required this.image,
    required this.quantity,
    required this.expiration_date,
    required this.price,
  });
  factory ProductCategory.fromMap(Map<String, dynamic> map) {
    return ProductCategory(
      id: map['id'] as num,
      sci_name: map['sci_name'] as String,
      com_name: map['com_name'] as String,
      manufacturer: map['manufacturer'] as String,
      image: map['image'] as String,
      quantity: map['quantity'] as num,
      expiration_date: map['expiration_date'] as String,
      price: map['price'] as num,
    );
  }

  ProductCategory copyWith({
    num? id,
    String? sci_name,
    String? com_name,
    String? manufacturer,
    String? image,
    num? quantity,
    String? expiration_date,
    num? price,
  }) {
    return ProductCategory(
      id: id ?? this.id,
      sci_name: sci_name ?? this.sci_name,
      com_name: com_name ?? this.com_name,
      manufacturer: manufacturer ?? this.manufacturer,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      expiration_date: expiration_date ?? this.expiration_date,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sci_name': sci_name,
      'com_name': com_name,
      'manufacturer': manufacturer,
      'image': image,
      'quantity': quantity,
      'expiration_date': expiration_date,
      'price': price,
    };
  }

  String toJson() => json.encode(toMap());

  factory ProductCategory.fromJson(String source) => ProductCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductCategory(id: $id, sci_name: $sci_name, com_name: $com_name, manufacturer: $manufacturer, image: $image, quantity: $quantity, expiration_date: $expiration_date, price: $price)';
  }

  @override
  bool operator ==(covariant ProductCategory other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.sci_name == sci_name &&
      other.com_name == com_name &&
      other.manufacturer == manufacturer &&
      other.image == image &&
      other.quantity == quantity &&
      other.expiration_date == expiration_date &&
      other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      sci_name.hashCode ^
      com_name.hashCode ^
      manufacturer.hashCode ^
      image.hashCode ^
      quantity.hashCode ^
      expiration_date.hashCode ^
      price.hashCode;
  }
}

class ProductCategoryFixed{
  num id;
  String com_name_en;
  String image;
  num price;
  ProductCategoryFixed({required this.com_name_en,required this.id,required this.price,required this.image});
  factory ProductCategoryFixed.fromMap(Map<String, dynamic> map) {
    return ProductCategoryFixed(
      image: map['image'] as String,
      com_name_en: map['com_name'] as String,
      id: map['id'] as num,
      price: map['price'] as num,
    
    );
  }
}