import 'package:flutter/material.dart';

class MainDropDown extends StatefulWidget {
  final List<String> values;
  final String defaultValue;
  const MainDropDown(
      {Key? key, required this.values, required this.defaultValue})
      : super(key: key);

  @override
  State<MainDropDown> createState() => _MainDropDownState();
}

class _MainDropDownState extends State<MainDropDown> {
  var defaultValue = '';

  @override
  void initState() {
    super.initState();
    defaultValue = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: defaultValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      underline: Container(),
      onChanged: (newValue) {
        setState(() {
          defaultValue = newValue!;
        });
      },
      items: widget.values.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
