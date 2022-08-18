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
                      child: Text(tr.value.toString(),
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
                      Text(tr.date.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
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