import 'package:flutter/material.dart';
import '../widgets/categories_grid.dart';

class ProductCatgScreen extends StatelessWidget {
  static const routeName = '/product-catgories';

  @override
  Widget build(BuildContext context) {
    final catgTitle = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(catgTitle.toString()),
      ),
      body: CategoriesGrid(catgTitle.toString()),
    );
  }
}
