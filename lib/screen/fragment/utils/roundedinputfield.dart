import 'package:ahp_maya/screen/fragment/utils/textfieldcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType onValidate;
  const RoundedInputField(
      {Key? key,
      required this.hintText,
      this.icon = Icons.person,
      required this.onChanged,
      required this.onValidate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: onValidate,
        cursorColor: Colors.indigo.shade300,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp("[@.a-zA-Z ]")),
        ], // O
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: const Color.fromARGB(255, 46, 67, 169)
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
