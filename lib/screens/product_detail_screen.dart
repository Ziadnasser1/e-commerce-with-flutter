// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

import '../widgets/product_item.dart';
import '../widgets/product_may_like.dart';
import '../widgets/info_bars.dart';
import '../widgets/floating_button_cart.dart';
import '../widgets/price_Rating_info.dart';
import '../widgets/get_discription.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as ProductItem;
    final nPrice =
        (product.price + product.price * (20 / 100)).toStringAsFixed(2);
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.white,
            height: 1.0,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'e-commerce',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(product.imageUrl),
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'SSGHLBHVD1293DSCM1',
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 45),
                Icon(
                  Icons.chat_outlined,
                  color: Theme.of(context).hintColor,
                ),
                const SizedBox(width: 20),
                Icon(
                  Icons.share_sharp,
                  color: Theme.of(context).hintColor,
                ),
              ],
            ),
            PriceandRatingInfo(nPrice, product),
            const Divider(height: 5, color: Colors.grey),
            infoBars(),
            const SizedBox(height: 10),
            const Divider(height: 5, color: Colors.grey),
            // getDescription(product.id),
            getDescription(product.id),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Text(
                'You May Also Like',
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            ProductMayLikeList(product.id),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FLoatingButtonCart(
        product.id,
        product.price,
        product.imageUrl,
        'ADD TO CART',
      ),
    );
  }
}
