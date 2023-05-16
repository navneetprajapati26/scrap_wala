import 'package:flutter/material.dart';
import 'package:scrap_wala/screens/transction_history_screen/transction_history_model.dart';
class TransctionHistoryScreen extends StatefulWidget {
  const TransctionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TransctionHistoryScreen> createState() => _TransctionHistoryScreenState();
}

class _TransctionHistoryScreenState extends State<TransctionHistoryScreen> {

  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Scrap',
      amount: 75.50,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't2',
      title: 'Scrap',
      amount: 40.00,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: 't3',
      title: 'Scrap',
      amount: 32.00,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 't4',
      title: 'Scrap',
      amount: 125.75,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          final transaction = transactions[index];
          return ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(transaction.title),
            subtitle: Text(transaction.date.toString()),
            trailing: Text('₹ ${transaction.amount.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
