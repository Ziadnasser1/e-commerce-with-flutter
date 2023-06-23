import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../widgets/floating_button_cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            width: 300,
            height: 50,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              onPressed: null,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'USE DISCOUNT CODE',
                  style: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 450,
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: ((context, i) => CartItem(
                    productId: cart.items.keys.toList()[i],
                    id: cart.items.values.toList()[i].id,
                    imageUrl: cart.items.values.toList()[i].imageUrl,
                    quantity: cart.items.values.toList()[i].quantity,
                    price: cart.items.values.toList()[i].price,
                  )),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
            alignment: Alignment.topRight,
            child: Text(
              'SUBTOTAL EGP ${cart.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 18,
              ),
            ),
          ),
          FLoatingButtonCart('UNUSED', 111, 'UNUSED', 'CHECKOUT'),
        ],
      ),
    );
  }
}
