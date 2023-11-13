import 'package:expenses/Models/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
        id: '1',
        title: 'novo tenis de corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(
        id: '2',
        title: 'conta de luz cara',
        value: 120.56,
        date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: Column(
          children: [
            Card(
              child: Text('Grafico'),
            ),
            Card(
              child: Text('Lista de Transações'),
            )
          ],
        ));
  }
}
