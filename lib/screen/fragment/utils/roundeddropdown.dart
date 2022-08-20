// ignore_for_file: library_private_types_in_public_api

import 'package:ahp_maya/screen/fragment/utils/textfieldcontainer.dart';
import 'package:flutter/material.dart';

class RoundedDropdown extends StatefulWidget {
  final int value;
  final String hintText;
  final IconData icon;
  final List<DropdownMenuItem<int>> items;
  final void Function(int?) onChanged;
  const RoundedDropdown({
    Key? key,
    required this.value,
    required this.hintText,
    required this.icon,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RoundedDropdownState createState() => _RoundedDropdownState();
}

class _RoundedDropdownState extends State<RoundedDropdown> {
  @override
  Widget build(BuildContext context) {
    // avoid keyboard appearing
    //FocusScope.of(context).requestFocus(new FocusNode());
    return TextFieldContainer(
      child: InputDecorator(
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: const Color.fromARGB(255, 46, 67, 169)),
          border: InputBorder.none,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text(widget.hintText),
            value: widget.value,
            items: widget.items,
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}
