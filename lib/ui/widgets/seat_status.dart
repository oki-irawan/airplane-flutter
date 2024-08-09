import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class SeatStatus extends StatelessWidget {
  final String imgUrl;
  final String textStatus;

  const SeatStatus({
    Key? key,
    required this.imgUrl,
    required this.textStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          margin: EdgeInsets.only(
            right: 6,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                imgUrl,
              ),
            ),
          ),
        ),
        Text(
          textStatus,
          style: blackTextStyle,
        )
      ],
    );
  }
}
