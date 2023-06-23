import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String productId;
  final String id;
  final int quantity;
  final double price;

  CartItem({
    required this.productId,
    required this.id,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(right: 7),
                width: 130,
                height: 200,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 200,
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 8),
                    Text(
                      'TOWN TEAM',
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'SSFGVHBTYJ754DFMKFVN1',
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Quantity                     $quantity',
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'EGP $price',
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.delete,
                            color: Theme.of(context).hintColor,
                          ),
                          onTap: () {
                            Provider.of<Cart>(context, listen: false)
                                .removeItem(productId);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
