import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class FLoatingButtonCart extends StatelessWidget {
  final String title;
  final String productId;
  final double price;
  final String imageUrl;

  FLoatingButtonCart(
    this.productId,
    this.price,
    this.imageUrl,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Container(
      width: 345,
      height: 60,
      child: FloatingActionButton(
        heroTag: null,
        backgroundColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        onPressed: () => title == 'ADD TO CART'
            ? cart.addItem(productId, price, imageUrl)
            : null,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).canvasColor,
              fontSize: 21,
            ),
          ),
        ),
      ),
    );
  }
}
