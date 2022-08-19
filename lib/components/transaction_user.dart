import 'dart:math';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../models/transacoes.dart';
import 'transactions_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final _transactions = [
    Transactions(
      id: 't1',
      title: 'Novo Tênis', 
      value: 310.32, 
      date: DateTime.now()
    ),
    Transactions(
      id: 't2', 
      title: 'Conta de Luz', 
      value: 156.75, 
      date: DateTime.now()
    ),  
  ];

  _addTransaction(String title, double value){
    final newTransaction = Transactions(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionsList(_transactions),
        TransactionForm(),
      ],
    );
  }
}