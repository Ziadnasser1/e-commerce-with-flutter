import 'package:flutter/material.dart';

import './container_creator.dart';

class infoBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Color',
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 17,
                ),
              ),
            ),
            ContainersCreator('GOOD', Colors.grey),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Size',
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 17,
                ),
              ),
            ),
            ContainersCreator('XL', Colors.grey.shade900),
            ContainersCreator('4XL', Colors.grey.shade900),
            ContainersCreator('M', Colors.grey.shade900),
            ContainersCreator('S', Colors.grey.shade900),
            ContainersCreator('L', Colors.grey.shade900),
          ],
        ),
      ],
    );
  }
}
