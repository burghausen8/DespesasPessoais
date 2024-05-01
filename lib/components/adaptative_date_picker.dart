import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        onDateChanged(pickedDate);
      }
    });
  }

  AdaptativeDatePicker(
      {required this.selectedDate, required this.onDateChanged});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              onDateTimeChanged: onDateChanged,
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
            ),
          )
        : Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}',
                  ),
                ),
                TextButton(
                  onPressed: () => _showDatePicker(context),
                  child: Text(
                    'Selecionar Data',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          );
  }
}
