import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePick extends StatefulWidget{
  final String label;
  DatePick(
    this.label
  );
  @override
  _DatePickState createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  TextEditingController date=TextEditingController();
  DateTime _selectedDate;
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days:220)),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        date.text=DateFormat.yMd().format(_selectedDate);
      });
    });
    print('...');
  }
  @override
  Widget build(BuildContext context){
    return Container(
      margin:EdgeInsets.fromLTRB(20,0,20,0),
      child:TextField(
        decoration:InputDecoration(
          hintText:widget.label,
          labelText:widget.label,
          suffixIcon:IconButton(
            icon:Icon(Icons.calendar_today,color:Colors.blue),
            onPressed:_presentDatePicker,
          )
        ),
        controller:date,
      )
    );
  }
}