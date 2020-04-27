
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mark_it_client/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTxn;

  TransactionList(this.transactions, this._deleteTxn);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text('No Transactions added yet!',
                    style: Theme.of(context).textTheme.title),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: constraints.maxHeight*0.6,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: FittedBox(
                            child: Text('₹${transactions[index].amount}')),
                      )),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  
                  subtitle: Text(transactions[index].description),
                  isThreeLine: true,
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteTxn(transactions[index].id),
                      color: Theme.of(context).errorColor),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
