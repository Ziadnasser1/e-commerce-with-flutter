import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/firestore_data.dart';
import '../api/firebase_storage.dart';
import '../screens/product_overview_screen.dart';

class SplashedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fireStorage = Provider.of<Storage>(context);
    var fireStore = Provider.of<FillFireStore>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _fetchDataAndNavigate(context, fireStorage, fireStore),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/e-commerce.jpg',
                  fit: BoxFit.cover,
                ),
                Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Future<void> _fetchDataAndNavigate(
      BuildContext context, Storage fireStorage, FillFireStore fireStore) async {
    await Future.wait(
      <Future<void>>[
        fireStorage.listFile("ad", fireStorage.adsImagesUrl),
        fireStorage.listFile("ts", fireStorage.tsImagesUrl),
        fireStorage.listFile("tr", fireStorage.tImagesUrl),
        fireStorage.listFile('sh', fireStorage.sImages),
        fireStorage.listFile('gl', fireStorage.gImages),
        fireStorage.listFile('ks', fireStorage.kImages),
        fireStore.retrievekData(),
        fireStore.retrievetData(),
        fireStore.retrievesData(),
        fireStore.retrievetsData(),
        fireStore.retrievegData(),
      ].map((future) => future as Future<void>),
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => FutureBuilder<void>(
          future: fireStorage.loadImages(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Only show the loading circle while the images are being loaded
              return Stack(
                children: [
                  Image.asset(
                    'assets/e-commerce.jpg',
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ],
              );
            } else {
              return ProductOverviewScreen();
            }
          },
        ),
      ),
    );
  }
}
