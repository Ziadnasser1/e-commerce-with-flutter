// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/firestore_data.dart';
import '../api/firebase_storage.dart';

import './product_item.dart';
import '../models/cart.dart';

class CategoriesGrid extends StatelessWidget {
  var nList;
  var nImageList;
  final String catgTitle;

  CategoriesGrid(this.catgTitle);

  @override
  Widget build(BuildContext context) {
    final fireStore = Provider.of<FillFireStore>(context);
    var fireStorage = Provider.of<Storage>(context);
    var tsImages = fireStorage.tsImagesUrl;
    var tImages = fireStorage.tImagesUrl;
    var sImages = fireStorage.sImages;
    var kImages = fireStorage.kImages;
    var gImages = fireStorage.gImages;
    tsImages.sort();
    tImages.sort();
    sImages.sort();
    kImages.sort();
    gImages.sort();

    var xtrousers = fireStore.tdata?["products"];
    var xtshirts = fireStore.tsdata?["ts-products"];
    var xshoes = fireStore.sdata?["s-products"];
    var xglasses = fireStore.gdata?["g-products"];
    var xkids = fireStore.kdata?["k-products"];
    final cart = Provider.of<Cart>(context);
    if (catgTitle == 'T-Shirts') {
      nList = xtshirts;
      nImageList = tsImages;
    } else if (catgTitle == 'Shoes') {
      nList = xshoes;
      nImageList = sImages;
    } else if (catgTitle == 'Glasses') {
      nList = xglasses;
      nImageList = gImages;
    } else if (catgTitle == 'Kids') {
      nList = xkids;
      nImageList = kImages;
    } else {
      nList = xtrousers;
      nImageList = tImages;
    }
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: nList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.45,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: ((context, index) => Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  child: ProductItem(
                    id: nList[index]["id"],
                    title: nList[index]["title"],
                    imageUrl: nImageList[index],
                    price: nList[index]["price"],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  margin: EdgeInsets.all(5),
                  width: 150,
                  height: 30,
                  child: GestureDetector(
                    onTap: () {
                      cart.addItem(
                        nList[index]["id"],
                        nList[index]["price"],
                        nImageList[index],
                      );
                    },
                    child: Text(
                      'ADD TO CART',
                      style: TextStyle(
                        color: Theme.of(context).canvasColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
