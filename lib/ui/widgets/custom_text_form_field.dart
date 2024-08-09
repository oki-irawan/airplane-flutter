import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelField;
  final String placeHolder;
  final EdgeInsets margin;
  final bool isObsecure;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.labelField,
    required this.placeHolder,
    required this.controller,
    this.margin = const EdgeInsets.only(
      bottom: 20,
    ),
    this.isObsecure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelField,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: regular,
            ),
            obscureText: isObsecure,
            controller: controller,
            cursorWidth: 1.0,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
              hintText: placeHolder,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
