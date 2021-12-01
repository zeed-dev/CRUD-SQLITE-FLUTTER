import 'package:crud_regmal/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget allertWidget({required String message, required Function() onTap}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.fromLTRB(
      defaultMargin,
      defaultMargin,
      defaultMargin,
      0,
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
    decoration: BoxDecoration(
      color: kOrange,
      borderRadius: BorderRadius.circular(3),
      border: Border.all(
        color: kOrangeSecondary,
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.warning,
          color: kOrangeDark,
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            message,
            style: kBodyText.copyWith(
              color: kYellow,
              fontSize: 14,
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Icon(
            Icons.close,
            color: kOrangeDark,
          ),
        )
      ],
    ),
  );
}
