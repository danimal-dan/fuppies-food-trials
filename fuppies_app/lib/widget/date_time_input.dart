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
    DateTime initialDateTime = selectedDateTime ?? DateTime.now();
    final String displayString = prettyPrintDateTime(initialDateTime);

    return TextFormField(
      key: Key(initialDateTime.millisecondsSinceEpoch.toString()),
      initialValue: displayString,
      onTap: () async {
        final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: initialDateTime,
            firstDate: initialDateTime.subtract(const Duration(days: 365)),
            lastDate: DateTime.now());

        if (picked == null) {
          return;
        }

        final TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay(
                hour: initialDateTime.hour, minute: initialDateTime.minute),
            initialEntryMode: TimePickerEntryMode.input);

        final DateTime pickedDateWithOriginalTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            pickedTime?.hour ?? initialDateTime.hour,
            pickedTime?.minute ?? initialDateTime.minute,
            0);

        setState(() {
          selectedDateTime = pickedDateWithOriginalTime;
        });

        widget.onChanged?.call(pickedDateWithOriginalTime);
      },
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Date',
        contentPadding: EdgeInsets.all(0.0),
      ),
    );
  }
}
