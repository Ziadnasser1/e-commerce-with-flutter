// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import './product_item.dart';

class listOfProducts extends StatelessWidget {
  var _item;
  var _images;

  listOfProducts(this._item, this._images);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          initialPage: 1,
          enableInfiniteScroll: false,
          viewportFraction: 0.45,
          height: 350,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
        ),
        itemCount: 4,
        itemBuilder: ((context, index, _) => Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: ProductItem(
                id: _item[index]["id"],
                title: _item[index]["title"],
                imageUrl: _images[index],
                price: _item[index]["price"],
              ),
            )),
      ),
    );
  }
}
