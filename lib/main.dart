// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:despesas_pessoais/models/transacoes.dart';
import 'package:flutter/material.dart';

main() => runApp(Despesas());

class Despesas extends StatelessWidget {
  const Despesas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget{

  final _transacoes = [
    Transacoes(
      id: 't1',
      title: 'Novo Tênis', 
      value: 310.32, 
      date: DateTime.now()
    ),
    Transacoes(
      id: 't2', 
      title: 'Conta de Luz', 
      value: 156.75, 
      date: DateTime.now()
    ),  
  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Desespesas Pessoais'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Grafico'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transacoes.map((tr) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(tr.value.toString()),
                    ),
                  Column(
                    children: <Widget>[
                      Text(tr.title),
                      Text(tr.date.toString()),
                    ],
                  )
                  ] 
                ),
              );
            }).toList(),
          )
        ],
      )
    );
  }
} 