class Medicine {
  final String image;
  final String sName;
  final String tName;
  final String? orderStatus;
  final String? orderPharmacy;
  final String? company;
  final String? expirationDate; 
  final String? orderDate; 
  final int? quantity;
  final double? price;
  final bool? paymentStatus;

  const Medicine( {
   this.quantity,
    this.price,
    this.paymentStatus,
    required this.image,
    required this.sName,
    required this.tName,
    this.orderStatus,
    this.orderPharmacy,
    this.company,
    this.expirationDate, 
    this.orderDate, 
  });
}
//هاد الكلاس مشان الادوية الومجودة بالليستات تبع
//MyGoods & MyOrders
//حطيتن كلن required
//الا تاريخ الطلب وتاريخ انتهاء الصلاحية لانه بيعتمد عالصفحة اذا طلباتي او بضاعتي