import '../screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double price;

  ProductItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final nPrice = (price + price * (20 / 100)).toStringAsFixed(2);
    return Container(
      height: 300,
      width: 200,
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black,
          subtitle: Text(
            'EGP$nPrice',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: 10,
            ),
          ),
          trailing: Text(
            'EGP$price',
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 14,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: ProductItem(
                id: id,
                title: title,
                imageUrl: imageUrl,
                price: price,
              ),
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
