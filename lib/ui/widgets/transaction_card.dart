import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/booking_detail_item.dart';
import 'package:airplane/ui/widgets/new_destination_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(
          defaultRadius,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NewDestinationCard(
            destination: transaction.destination,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Booking Details',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),

          // NOTE : BOOKING ITEMS
          BookingDetailItem(
            title: 'Traveler',
            valueText: '${transaction.totalTraveler} person',
            valueColor: kBlackColor,
          ),
          BookingDetailItem(
            title: 'Seat',
            valueText: transaction.selectedSeat,
            valueColor: kBlackColor,
          ),
          BookingDetailItem(
            title: 'Insurance',
            valueText: transaction.insurance ? 'YES' : 'NO',
            valueColor: transaction.insurance ? kGreenColor : kRedColor,
          ),
          BookingDetailItem(
            title: 'Refundable',
            valueText: transaction.refundable ? 'YES' : 'NO',
            valueColor: transaction.refundable ? kGreenColor : kRedColor,
          ),
          BookingDetailItem(
            title: 'VAT',
            valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
            valueColor: kBlackColor,
          ),
          BookingDetailItem(
            title: 'Price',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(
              transaction.price,
            ),
            valueColor: kBlackColor,
          ),
          BookingDetailItem(
            title: 'Grand Total',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(
              transaction.grandTotal,
            ),
            valueColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
