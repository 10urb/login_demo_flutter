import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class InDateTimeFormField extends StatelessWidget {
  InDateTimeFormField(
      {Key? key,
      required this.label,
      required this.onDateSelected,
      required this.validator})
      : super(key: key);
  void Function(DateTime value) onDateSelected;
  String? Function(DateTime? value)? validator;
  Widget label;

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      onDateSelected: onDateSelected,
      mode: DateTimeFieldPickerMode.date,
      validator: validator,
      dateFormat: DateFormat.yMMMMEEEEd(),
      decoration: InputDecoration(
        label: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
