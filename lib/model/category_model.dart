

class CategoryModel {
  num id;
  String name;
  
  CategoryModel({required this.id,required this.name});


  
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] as String,
      id: map['id'] as num,
    );
  }

}