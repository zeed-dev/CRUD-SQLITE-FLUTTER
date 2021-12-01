import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> alertDialogCustom(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            actions: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text("OK")),
              )
            ],
            title: Column(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: MediaQuery.of(context).size.width / 4,
                ),
                Text(
                  "Berhasil di tersimpan",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Data saved successfuly",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                ),
              ],
            ),
          ));
}
