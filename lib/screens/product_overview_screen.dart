// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/firestore_data.dart';
import '../api/firebase_storage.dart';

import '../models/products_list.dart';

import '../widgets/category_item.dart';
import '../widgets/list_of_profucts.dart';
import '../widgets/side_drawer.dart';

import './cart_screen.dart';

class ProductOverviewScreen extends StatelessWidget {
  static const routeName = '/product-overView';

  @override
  Widget build(BuildContext context) {
    var fireStorage = Provider.of<Storage>(context);
    var adsImage = fireStorage.adsImagesUrl;
    var tsImages = fireStorage.tsImagesUrl;
    var tImages = fireStorage.tImagesUrl;
    var sImages = fireStorage.sImages;
    var fireStore = Provider.of<FillFireStore>(context);
    var xtrousers = fireStore.tdata?["products"];
    var xtshirts = fireStore.tsdata?["ts-products"];
    var xshoes = fireStore.sdata?["s-products"];

    final List<String> category = allCatg;
    final List<String> categoryName = catgName;

    return Scaffold(
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
        actions: <Widget>[
          const Icon(
            Icons.chat_sharp,
            size: 25,
          ),
          TextButton(
            onPressed: (() =>
                Navigator.of(context).pushNamed(CartScreen.routeName)),
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: SideDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AdsContainer(adsImage[0]),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) => Column(
                  children: [
                    Row(
                      children: [
                        CategoryItem(category[index], categoryName[index]),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Text(
                      categoryName[index],
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 17,
                      ),
                    ),
                  ],
                )),
                itemCount: 6,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            listOfProducts(xtshirts, tsImages),
            AdsContainer(adsImage[1]),
            listOfProducts(xtrousers, tImages),
            AdsContainer(adsImage[2]),
            listOfProducts(xshoes, sImages),
          ],
        ),
      ),
    );
  }

  Container AdsContainer(String adsUrl) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Image.network(
        adsUrl,
      ),
    );
  }
}
