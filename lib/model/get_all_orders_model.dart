// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetAllOrdersModel {
  num id;
  num user_id;
  
  String ordered_at;
  num total_price;
  num paid;
  GetAllOrdersModel({
    required this.id,
    required this.user_id,
    required this.ordered_at,
    required this.total_price,
    required this.paid,
  });

  GetAllOrdersModel copyWith({
    num? id,
    num? user_id,
    String? ordered_at,
    num? total_price,
    num? paid,
  }) {
    return GetAllOrdersModel(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      ordered_at: ordered_at ?? this.ordered_at,
      total_price: total_price ?? this.total_price,
      paid: paid ?? this.paid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'ordered_at': ordered_at,
      'total_price': total_price,
      'paid': paid,
    };
  }

  factory GetAllOrdersModel.fromMap(Map<String, dynamic> map) {
    return GetAllOrdersModel(
      id: map['id'] as num,
      user_id: map['user_id'] as num,
      ordered_at: map['ordered_at'] as String,
      total_price: map['total_price'] as num,
      paid: map['paid'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAllOrdersModel.fromJson(String source) => GetAllOrdersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetAllOrdersModel(id: $id, user_id: $user_id, ordered_at: $ordered_at, total_price: $total_price, paid: $paid)';
  }

  @override
  bool operator ==(covariant GetAllOrdersModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.user_id == user_id &&
      other.ordered_at == ordered_at &&
      other.total_price == total_price &&
      other.paid == paid;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user_id.hashCode ^
      ordered_at.hashCode ^
      total_price.hashCode ^
      paid.hashCode;
  }
}
