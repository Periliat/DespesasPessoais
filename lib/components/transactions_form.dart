import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TransactionForm extends StatefulWidget {

  final void Function (String, double, DateTime) onSubmit;


  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  var _selectedDate = DateTime.now();

  _subimitForm(){
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    
    if(title.isEmpty || value == 0){
      return;
    }

    widget.onSubmit(title, value, _selectedDate);

  }

  _showDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019), 
      lastDate: DateTime.now(),
      ).then((pickedDate){
        if(pickedDate == null){
          return;
        }

        setState(() {
          _selectedDate = pickedDate;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 5,
              child: TextField(
                controller: _titleController,
                onSubmitted: (_) => _subimitForm(),
                decoration: 
                  const InputDecoration(
                    labelText: 'Título da Operação',
                    contentPadding: EdgeInsets.all(5),
                  ),
              ),
            ),
            Card(
              elevation: 5,
              child: TextField(
                controller: _valueController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _subimitForm(),
                decoration: 
                  const InputDecoration(
                    labelText: 'Valor (R\$)',
                    contentPadding: EdgeInsets.all(5),
                  ),
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null ? 'Nenhuma Data Selecionada!' : 'Data Selecionada ${DateFormat('dd/MM/y').format(_selectedDate)}'
                      )
                    ),
                  ElevatedButton(
                    //textColor: Theme.of(context).colorScheme,
                    onPressed: _showDatePicker, 
                    child: const Text(
                      'Selecionar Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Enviar'),
                  //textColor: Colors.purple,
                  onPressed: _subimitForm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}