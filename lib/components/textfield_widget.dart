import 'package:crud_regmal/common/constants.dart';
import 'package:crud_regmal/utils/date_helper.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textSearchFieldWidget({required TextEditingController controller}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Cari data...",
        border: OutlineInputBorder(),
        isDense: true,
        prefixIcon: Icon(Icons.search),
      ),
    ),
  );
}

Widget textFieldWidget({
  required String label,
  String? hintText,
  required TextEditingController controller,
  required TextInputType inputType,
  required Function(String) onChanged,
  int minLines = 1,
  int maxLines = 1,
  bool isEnabled = true,
}) {
  return TextFormField(
    enabled: isEnabled,
    minLines: minLines,
    maxLines: maxLines,
    validator: (value) {
      if (value!.isEmpty) {
        return "$label tidak boleh kosong";
      } else {
        return null;
      }
    },
    controller: controller,
    keyboardType: inputType,
    onChanged: onChanged,
    decoration: InputDecoration(
      labelText: label,
      hintText: hintText,
      border: OutlineInputBorder(),
      isDense: true,
    ),
  );
}

Widget dateFieldWidget({
  required String label,
  required TextEditingController dateController,
  required BuildContext context,
  required Function(String) onChanged,
  bool isEnabled = true,
}) {
  return TextFormField(
    enabled: isEnabled,
    onTap: () async {
      var dataTime = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2016),
          lastDate: DateTime.now());
      dateController.text =
          DateHelper.changeFormatIdToDateTimeFormat(dataTime!);
      print("ontappp date ${dateController.text}");
    },
    validator: (value) {
      if (value!.isEmpty) {
        return "$label tidak boleh kosong";
      } else {
        return null;
      }
    },
    onSaved: (value) {},
    onChanged: (value) {},
    controller: dateController,
    readOnly: true,
    decoration: InputDecoration(
      suffixIcon: Icon(Icons.date_range_outlined),
      border: OutlineInputBorder(),
      labelText: label,
      isDense: true,
    ),
  );
}

Widget dropDownSearchWidget({
  required String label,
  required TextEditingController controller,
  required List<dynamic> items,
  Function? getData,
  required Function(dynamic) onChanged,
  bool isEnabled = true,
}) {
  return DropdownSearch<dynamic>(
    enabled: isEnabled,
    items: items,
    maxHeight: 300,
    onFind: getData == null ? null : (dynamic filter) => getData(filter),
    validator: (value) {
      if (value == null || value == '') {
        return "$label tidak boleh kosong";
      } else {
        return null;
      }
    },
    onChanged: onChanged,
    showSearchBox: getData == null ? false : true,
    dropdownSearchDecoration: InputDecoration(
      labelText: label,
      contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      border: OutlineInputBorder(),
      isDense: true,
    ),
  );
}

Widget dropDownSearchApiWidget({
  required String label,
  required TextEditingController controller,
  Function? getData,
  required dynamic selectedItem,
  required Function(dynamic) onChanged,
  bool isEnabled = true,
}) {
  return DropdownSearch<dynamic>(
    enabled: isEnabled,
    showSearchBox: true,
    showSelectedItems: true,
    compareFn: (i, s) => i?.isEqual(s) ?? false,
    validator: (value) {
      if (value == null || value == '') {
        return "$label tidak boleh kosong";
      } else {
        return null;
      }
    },
    dropdownSearchDecoration: InputDecoration(
      labelText: label,
      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
      border: OutlineInputBorder(),
    ),
    onFind: (dynamic filter) => getData!(),
    onChanged: onChanged,
  );
}

Widget checkBoxWidget({
  required String label,
  required bool value,
  required Function(dynamic) onChanged,
}) {
  return CheckboxListTile(
    dense: true,
    value: value,
    onChanged: onChanged,
    title: new Text(
      label,
      style: TextStyle(fontSize: 14.0),
    ),
    controlAffinity: ListTileControlAffinity.leading,
    activeColor: Colors.green,
  );
}

Widget radioButtonWidget({
  required String label,
  required String value,
  required String grupVal,
  required Function(dynamic) onChanged,
}) {
  return RadioListTile(
    dense: true,
    value: value,
    groupValue: grupVal,
    onChanged: onChanged,
    title: new Text(
      label,
      style: TextStyle(fontSize: 14.0),
    ),
    controlAffinity: ListTileControlAffinity.leading,
    activeColor: Colors.green,
  );
}
