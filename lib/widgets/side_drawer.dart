import 'package:e_commerce/screens/product_catg_list_screen.dart';

import '../screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: (icon == FontAwesomeIcons.shirt) ? 23 : 33,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      onTap: (() => tabHandler()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            color: Colors.black,
            child: Text(
              'e - commerce',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 26,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
          buildListTile('HOME PAGE', Icons.home, () {
            Navigator.of(context)
                .pushReplacementNamed(ProductOverviewScreen.routeName);
          }),
          buildListTile('T-Shirt', FontAwesomeIcons.shirt, () {
            Navigator.of(context).pushNamed(
              ProductCatgScreen.routeName,
              arguments: 'T-Shirts',
            );
          }),
          buildListTile('OFFERS', Icons.local_offer, () {
            null;
          }),
          buildListTile('WINTER WEAR', Icons.cloudy_snowing, () {
            null;
          }),
          buildListTile('TROUSERS', FontAwesomeIcons.personRunning, () {
            Navigator.of(context).pushNamed(
              ProductCatgScreen.routeName,
              arguments: 'Trousers',
            );
          }),
          buildListTile('SHOES', FontAwesomeIcons.shoePrints, () {
            Navigator.of(context).pushNamed(
              ProductCatgScreen.routeName,
              arguments: 'Shoes',
            );
          }),
          buildListTile('ACCESSORIES', FontAwesomeIcons.socks, () {
            null;
          }),
          buildListTile('MY ACCOUNT', Icons.account_circle_rounded, () {
            null;
          }),
        ],
      ),
    );
  }
}
