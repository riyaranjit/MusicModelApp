import 'package:flutter/material.dart';
import 'package:musicmodel/constants/assets.dart';

class CircleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // wrapped around a column so that the avatar doesn't stretch
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 24.0,
            backgroundImage: AssetImage(Assets.profile),
          )
        ],
      ),
    );
  }
}
