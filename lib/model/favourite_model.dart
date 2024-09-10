// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FavouriteModel {
String com_name_en;
String sci_name_en;
String image;

num id;
  FavouriteModel({
    required this.com_name_en,
    required this.sci_name_en,
    required this.image,
    
    required this.id,
  });


  FavouriteModel copyWith({
    String? com_name_en,
    String? sci_name_en,
    String? image,
    
    num? id,
  }) {
    return FavouriteModel(
      com_name_en: com_name_en ?? this.com_name_en,
      sci_name_en: sci_name_en ?? this.sci_name_en,
      image: image ?? this.image,
     
     id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'com_name_en': com_name_en,
      'sci_name_en': sci_name_en,
      'image': image,
      'id': id,
    };
  }

  factory FavouriteModel.fromMap(Map<String, dynamic> map) {
    return FavouriteModel(
      com_name_en: map['com_name_en'] as String,
      sci_name_en: map['sci_name_en'] as String,
      image: map['image'] as String,
     
     id: map['id'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory FavouriteModel.fromJson(String source) => FavouriteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FavouriteModel(com_name_en: $com_name_en, sci_name_en: $sci_name_en, image: $image, id: $id)';
  }

  @override
  bool operator ==(covariant FavouriteModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.com_name_en == com_name_en &&
      other.sci_name_en == sci_name_en &&
      other.image == image &&
    
      other.id == id;
  }

  @override
  int get hashCode {
    return com_name_en.hashCode ^
      sci_name_en.hashCode ^
      image.hashCode ^
      
     id.hashCode;
  }
}
