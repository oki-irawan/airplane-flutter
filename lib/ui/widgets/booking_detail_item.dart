import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/interest_item.dart';
import 'package:flutter/material.dart';

class BookingDetailItem extends StatelessWidget {
  final String title;
  final String valueText;
  final Color valueColor;

  const BookingDetailItem({
    Key? key,
    required this.title,
    required this.valueText,
    required this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        children: [
          InterestItem(
            interestText: title,
          ),
          Text(
            valueText,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              color: valueColor,
            ),
          )
        ],
      ),
    );
  }
}
