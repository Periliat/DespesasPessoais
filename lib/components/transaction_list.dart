// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transacoes.dart';

class TransactionsList extends StatelessWidget {

  final List<Transactions> transactions;

  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index){
          final tr = transactions[index];
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 1.5,
                    )
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text('R\$${tr.value.toStringAsFixed(2)}', //valor da compra
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                //Informações da Operação
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Nome da operação
                  Text(tr.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  //Data
                  Text(
                    DateFormat('d MMM y').format(tr.date), //data
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
              ] 
            ),
          );
        },
      ),
    );
  }
}