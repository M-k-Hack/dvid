import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/gestures.dart';

class TextSwitchInput extends StatefulWidget {
  const TextSwitchInput({
    Key? key,
    this.header,
    this.placeholder,
    this.forceSwitch = false,
    this.switchHeader = '',
    required this.handleSwitch,
  }) : super(key: key);

  final String? header;
  final String? placeholder;
  final bool forceSwitch;
  final String switchHeader;
  final Function handleSwitch;

  @override
  State<TextSwitchInput> createState() => _TextSwitchInput();
}

class _TextSwitchInput extends State<TextSwitchInput> {
  bool enable = false;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: TextBox(
          header: widget.header,
          placeholder: widget.placeholder,
          expands: false,
          enabled: !enable && !widget.forceSwitch,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Column(children: [
        Text(
          widget.switchHeader,
          style: TextStyle(
              color: enable || widget.forceSwitch ? Colors.blue : Colors.black),
        ),
        ToggleSwitch(
          checked: enable || widget.forceSwitch,
          onChanged: (v) => {
            setState(() => enable = v || widget.forceSwitch),
            widget.handleSwitch(v)
          },
        )
      ])
    ]);
  }
}

class DateSwitchInput extends StatefulWidget {
  const DateSwitchInput({
    Key? key,
    this.header,
    this.placeholder,
    this.forceSwitch = false,
    this.switchHeader = '',
    this.date,
    required this.handleSwitch,
  }) : super(key: key);

  final String? header;
  final String? placeholder;
  final bool forceSwitch;
  final String switchHeader;
  final Function handleSwitch;
  final DateTime? date;

  @override
  State<DateSwitchInput> createState() => _DateSwitchInput();
}

class _DateSwitchInput extends State<DateSwitchInput> {
  bool enable = false;
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: DatePicker(
          header: widget.header,
          selected: enable || widget.forceSwitch ? widget.date : date,
          onChanged: (time) => setState(() => date = time),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Column(children: [
        Text(
          widget.switchHeader,
          style: TextStyle(
              color: enable || widget.forceSwitch ? Colors.blue : Colors.black),
        ),
        ToggleSwitch(
          checked: enable || widget.forceSwitch,
          onChanged: (v) => {
            setState(() => enable = v || widget.forceSwitch),
            widget.handleSwitch(v)
          },
        )
      ])
    ]);
  }
}
