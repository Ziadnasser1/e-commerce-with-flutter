import 'package:flutter/material.dart';

import '../screens/product_catg_list_screen.dart';

class CategoryItem extends StatelessWidget {
  final String catgUrl;
  final String catgName;

  CategoryItem(this.catgUrl, this.catgName);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(catgUrl),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductCatgScreen.routeName,
            arguments: catgName,
          );
        },
      ),
    );
  }
}
