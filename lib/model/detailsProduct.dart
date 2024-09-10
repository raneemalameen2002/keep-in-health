// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DetailsProduct {
   String com_name;
   String sci_name;
   num quantity;
   String expiration_date;
  String manufacturer;
  String image;
  num id;
  num price;
  DetailsProduct({
    required this.com_name,
    required this.sci_name,
    required this.quantity,
    required this.expiration_date,
    required this.manufacturer,
    required this.image,
    required this.id,
    required this.price,
  });

  DetailsProduct copyWith({
    String? com_name,
    String? sci_name,
    num? quantity,
    String? expiration_date,
    String? manufacturer,
    String? image,
    num? id,
    num? price,
  }) {
    return DetailsProduct(
      com_name: com_name ?? this.com_name,
      sci_name: sci_name ?? this.sci_name,
      quantity: quantity ?? this.quantity,
      expiration_date: expiration_date ?? this.expiration_date,
      manufacturer: manufacturer ?? this.manufacturer,
      image: image ?? this.image,
     
      id: id ?? this.id,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'com_name': com_name,
      'sci_name': sci_name,
      'quantity': quantity,
      'expiration_date': expiration_date,
      'manufacturer': manufacturer,
      'image': image,
      
      'id': id,
      'price': price,
    };
  }

  factory DetailsProduct.fromMap(Map<String, dynamic> map) {
    return DetailsProduct(
      com_name: map['com_name'] as String,
      sci_name: map['sci_name'] as String,
      quantity: map['quantity'] as num,
      expiration_date: map['expiration_date'] as String,
      manufacturer: map['manufacturer'] as String,
      image: map['image'] as String,
     
      id: map['id'] as num,
      price: map['price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailsProduct.fromJson(String source) => DetailsProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DetailsProduct(com_name: $com_name, sci_name: $sci_name, quantity: $quantity, expiration_date: $expiration_date, manufacturer: $manufacturer, image: $image, id: $id, price: $price)';
  }

  @override
  bool operator ==(covariant DetailsProduct other) {
    if (identical(this, other)) return true;
  
    return 
      other.com_name == com_name &&
      other.sci_name == sci_name &&
      other.quantity == quantity &&
      other.expiration_date == expiration_date &&
      other.manufacturer == manufacturer &&
      other.image == image &&
      other.id == id &&
      other.price == price;
  }

  @override
  int get hashCode {
    return com_name.hashCode ^
      sci_name.hashCode ^
      quantity.hashCode ^
      expiration_date.hashCode ^
      manufacturer.hashCode ^
      image.hashCode ^
      id.hashCode ^
      price.hashCode;
  }
}
