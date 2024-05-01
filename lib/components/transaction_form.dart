import 'package:expenses/components/adaptative_textfield.dart';
import 'package:flutter/material.dart';
import 'adaptative_button.dart';
import 'adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) return;

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptativeTextfield(
                controller: _titleController,
                label: "Titulo",
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeTextfield(
                  controller: _valueController,
                  label: 'Valor (R\$)',
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitForm()),
              AdaptativeDatePicker(
                  selectedDate: _selectedDate,
                  onDateChanged: (newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AdaptativeButton(
                      label: "Nova transação", onPressed: _submitForm),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
