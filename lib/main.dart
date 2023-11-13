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
            Container(
              child: Card(child: Text('Grafico')),
            ),
            Column(
              children: _transactions.map((tr) {
                return Card(
                  child: Text(tr.title),
                );
              }).toList(),
            )
          ],
        ));
  }
}
