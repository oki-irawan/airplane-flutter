import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final String imgUrl;

  const PhotoItem({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.only(
        right: 16,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            imgUrl,
          ),
        ),
        borderRadius: BorderRadius.circular(
          defaultRadius,
        ),
      ),
    );
  }
}
