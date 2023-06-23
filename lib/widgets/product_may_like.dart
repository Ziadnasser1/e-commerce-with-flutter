// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/firestore_data.dart';
import '../api/firebase_storage.dart';

import '../screens/product_detail_screen.dart';
import '../widgets/product_item.dart';

class ProductMayLikeList extends StatelessWidget {
  final String id;

  ProductMayLikeList(this.id);

  var nList;
  var nImageList;

  Widget build(BuildContext context) {
    var fireStore = Provider.of<FillFireStore>(context, listen: false);
    var xtrousers = fireStore.tdata?["products"];
    var xtshirts = fireStore.tsdata?["ts-products"];
    var xshoes = fireStore.sdata?["s-products"];
    var xglasses = fireStore.gdata?["g-products"];
    var xkids = fireStore.kdata?["k-products"];
    var fireStorage = Provider.of<Storage>(context);
    var tsImages = fireStorage.tsImagesUrl;
    var tImages = fireStorage.tImagesUrl;
    var sImages = fireStorage.sImages;
    var kImages = fireStorage.kImages;
    var gImages = fireStorage.gImages;
    if (id[0] == 't' && id[1] == 's') {
      nList = xtshirts;
      nImageList = tsImages;
    } else if (id[0] == 's') {
      nList = xshoes;
      nImageList = sImages;
    } else if (id[0] == 'g') {
      nList = xglasses;
      nImageList = gImages;
    } else if (id[0] == 'k') {
      nList = xkids;
      nImageList = kImages;
    } else {
      nImageList = tImages;
      nList = xtrousers;
    }

    return Container(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: ((context, index) => Container(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ProductDetailScreen.routeName,
                      arguments: ProductItem(
                        id: nList[index]["id"],
                        title: nList[index]["title"],
                        imageUrl: nImageList[index],
                        price: nList[index]["price"],
                      ),
                    );
                  },
                  child: Image.network(
                    nImageList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ))),
    );
  }
}
