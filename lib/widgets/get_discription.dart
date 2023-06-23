import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/firestore_data.dart';

class getDescription extends StatelessWidget {
  final String _product;
  getDescription(this._product);

  @override
  Widget build(BuildContext context) {
    var fireStore = Provider.of<FillFireStore>(context, listen: false);
    var xtrousers = fireStore.tdata?["products"];

    var xtshirts = fireStore.tsdata?["ts-products"];
    var xshoes = fireStore.sdata?["s-products"];
    var xglasses = fireStore.gdata?["g-products"];
    var xkids = fireStore.kdata?["k-products"];
    var nList;
    int index = 0;
    if (_product[0] == 't' && _product[1] == 's') {
      nList = xtshirts;
      index = int.parse(_product[2]) - 1;
    } else if (_product[0] == 's') {
      nList = xshoes;
      index = int.parse(_product[1]) - 1;
    } else if (_product[0] == 'g') {
      nList = xglasses;
      index = int.parse(_product[1]) - 1;
    } else if (_product[0] == 'k') {
      nList = xkids;
      index = int.parse(_product[1]) - 1;
    } else {
      nList = xtrousers;
      index = int.parse(_product[1]);
    }
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      width: double.infinity,
      child: Text(
        nList[index]["description"],
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 24,
        ),
      ),
    );
  }
}
