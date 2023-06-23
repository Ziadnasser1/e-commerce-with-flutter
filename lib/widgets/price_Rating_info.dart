import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import './product_item.dart';

class PriceandRatingInfo extends StatelessWidget {
  final String nPrice;
  final ProductItem productId;

  PriceandRatingInfo(this.nPrice, this.productId);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'EGP $nPrice',
            style: TextStyle(
              color: Theme.of(context).hintColor,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'EGP ${productId.price}',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 17,
            ),
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        RatingBar.builder(
          itemSize: 18.0,
          initialRating: 5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (context, _) => const Icon(
            Icons.star_border_outlined,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            //print(rating);
          },
        ),
      ],
    );
  }
}
