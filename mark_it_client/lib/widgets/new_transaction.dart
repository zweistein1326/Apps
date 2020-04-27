import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTxn;

  NewTransaction(this.addTxn);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  final _amountController = TextEditingController();
  final _phoneController = TextEditingController();

  DateTime _selectedDate;
  void _submitData() {
    if(_amountController.text.isEmpty){
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredDesc = _descController.text;
    final enteredAmount = double.parse(_amountController.text);
    final enteredPhone = double.parse(_phoneController.text);
    if (enteredDesc.isEmpty ||enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null || enteredPhone <= 0) {
      return;
    }

    widget.addTxn(enteredTitle, enteredAmount,enteredPhone,enteredDesc ,_selectedDate,);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
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
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
              controller: _phoneController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              controller: _descController,
              maxLines: 2,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : DateFormat.yMMMd().format(_selectedDate),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _presentDatePicker,
                      child: Text('Choose Date')),
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submitData,
              child: Text("Add Transaction"),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            ),
          ],
        ),
      ),
    );
  }
}
