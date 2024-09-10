// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:keep_in_health/model/order_model.dart';
import 'package:keep_in_health/model/order_product_model.dart';

class GetOrdersModel {
 List<OrderProductModel> orderProductModel;
List<OrderModel> orderModel;
  GetOrdersModel({
    required this.orderProductModel,
    required this.orderModel,
  });

  GetOrdersModel copyWith({
    List<OrderProductModel>? orderProductModel,
    List<OrderModel>? orderModel,
  }) {
    return GetOrdersModel(
      orderProductModel: orderProductModel ?? this.orderProductModel,
      orderModel: orderModel ?? this.orderModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderProductModel': orderProductModel.map((x) => x.toMap()).toList(),
      'orderModel': orderModel.map((x) => x.toMap()).toList(),
    };
  }

  factory GetOrdersModel.fromMap(Map<String, dynamic> map) {
    return GetOrdersModel(
      orderProductModel: List<OrderProductModel>.from((map['orderProductModel'] as List<int>).map<OrderProductModel>((x) => OrderProductModel.fromMap(x as Map<String,dynamic>),),),
      orderModel: List<OrderModel>.from((map['orderModel'] as List<int>).map<OrderModel>((x) => OrderModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetOrdersModel.fromJson(String source) => GetOrdersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetOrdersModel(orderProductModel: $orderProductModel, orderModel: $orderModel)';

  @override
  bool operator ==(covariant GetOrdersModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.orderProductModel, orderProductModel) &&
      listEquals(other.orderModel, orderModel);
  }

  @override
  int get hashCode => orderProductModel.hashCode ^ orderModel.hashCode;
}
