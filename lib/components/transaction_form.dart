import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) return;

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: valueController,
                onSubmitted: (_) => _submitForm(),
                decoration: InputDecoration(labelText: 'Valor (R\$)')),
            TextButton(
              onPressed: _submitForm,
              child: Text('Nova Transação'),
              style: TextButton.styleFrom(primary: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
