import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  // NOTE :
  // - 0 = Available
  // - 1 = Selected
  // - 2 = Unavailable

  final String id;
  final bool isAvailable;

  const SeatItem({
    Key? key,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (isAvailable) {
        // the seat available but selected
        if (isSelected) {
          return kPrimaryColor;
        }
        // the seat available but not selected
        else {
          kAvailableColor;
        }
      }
      // the seat not available
      else {
        return kUnavailableColor;
      }
    }

    borderColor() {
      if (isAvailable) {
        return kPrimaryColor;
      }
      // the seat not available
      else {
        return kUnavailableColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
          border: Border.all(
            color: borderColor(),
            width: 2,
          ),
        ),
        child: child(),
      ),
    );
  }
}
