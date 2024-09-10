// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderModel {
num id;
num user_id;
num paid;
num total_price;
  OrderModel({
    required this.id,
    required this.user_id,
    required this.paid,
    required this.total_price,
  });



  OrderModel copyWith({
    num? id,
    num? user_id,
    num? paid,
    num? total_price,
  }) {
    return OrderModel(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      paid: paid ?? this.paid,
      total_price: total_price ?? this.total_price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'paid': paid,
      'total_price': total_price,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as num,
      user_id: map['user_id'] as num,
      paid: map['paid'] as num,
      total_price: map['total_price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, user_id: $user_id, paid: $paid, total_price: $total_price)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.user_id == user_id &&
      other.paid == paid &&
      other.total_price == total_price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user_id.hashCode ^
      paid.hashCode ^
      total_price.hashCode;
  }
}
