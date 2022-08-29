import 'package:flutter/material.dart';
import 'package:fuppies_app/util/date_format_util.dart';

class DateTimeInput extends StatefulWidget {
  final DateTime? defaultValue;
  final void Function(DateTime?)? onChanged;

  const DateTimeInput({Key? key, this.defaultValue, this.onChanged})
      : super(key: key);

  @override
  State<DateTimeInput> createState() => _DateTimeInput();
}

class _DateTimeInput extends State<DateTimeInput> {
  DateTime? selectedDateTime;

  @override
  void initState() {
    super.initState();
    selectedDateTime = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Text(prettyPrintDateTime(selectedDateTime));
  }
}
