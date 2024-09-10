import 'package:flutter/material.dart';
import 'package:keep_in_health/model/category_model.dart';

class ItemSearchCategory extends StatelessWidget {
   ItemSearchCategory({super.key,required this.categoryModelobj});
CategoryModel categoryModelobj;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.10000000149011612),
      ),
      child: Text(categoryModelobj.name),
    );
  }
}