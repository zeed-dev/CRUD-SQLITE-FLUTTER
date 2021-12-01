import 'package:crud_regmal/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textButton(
    {required BuildContext context,
    required String title,
    required Function() onPressed}) {
  return Container(
    height: 46,
    margin: EdgeInsets.symmetric(
      horizontal: defaultMargin,
      vertical: 31,
    ),
    width: MediaQuery.of(context).size.width,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_circle_outline),
          SizedBox(
            width: 10,
          ),
          Text(title),
        ],
      ),
    ),
  );
}

Widget textButtonNoIcon({
  required BuildContext context,
  required String title,
  required Function() onPressed,
}) {
  return Container(
    height: 46,
    margin: EdgeInsets.symmetric(
      vertical: 31,
    ),
    width: MediaQuery.of(context).size.width,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          Text(title),
        ],
      ),
    ),
  );
}

Widget buttonItemSeleceted({
  required String title,
  required Function onTap,
  bool isSelected = false,
}) {
  return Expanded(
    flex: 1,
    child: InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: isSelected ? KGreenSecondary : kRichWhite,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: isSelected ? kPrussianBlue : kGrey),
        ),
        height: 40,
        child: Center(
          child: Text(
            title,
            style: kSubtitle.copyWith(
              color: kPrussianBlue,
            ),
          ),
        ),
      ),
    ),
  );
}
