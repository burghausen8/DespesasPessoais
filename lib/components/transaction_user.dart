import 'dart:math';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: '1',
        title: 'novo tenis de corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(
        id: '212345',
        title: 'conta de luz cara',
        value: 120.56,
        date: DateTime.now()),
    Transaction(
        id: '2234',
        title: 'conta de luz cara',
        value: 120.56,
        date: DateTime.now()),
    Transaction(
        id: '2123',
        title: 'conta de luz cara',
        value: 120.56,
        date: DateTime.now()),
    Transaction(
        id: '2',
        title: 'conta de luz cara',
        value: 120.56,
        date: DateTime.now()),
    Transaction(
        id: '299',
        title: 'conta de luz cara',
        value: 120.56,
        date: DateTime.now()),
    Transaction(
        id: '76',
        title: 'conta de luz cara',
        value: 120.56,
        date: DateTime.now()),
    Transaction(
        id: '56',
        title: 'conta de luz barta',
        value: 120.56,
        date: DateTime.now())
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(_transactions)
      ],
    );
  }
}
