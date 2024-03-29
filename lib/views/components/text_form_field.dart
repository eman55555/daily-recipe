import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final TextEditingController txt;
  final Widget widget;
  Widget? suffixWidget;
  final TextInputType type;
  final bool obscure;
  final List<TextInputFormatter> formatter;

  TextFieldWidget(
      {super.key,
      required this.formatter,
      required this.hint,
      required this.obscure,
      required this.txt,
      required this.type,
      required this.widget,
      this.suffixWidget});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: txt,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        keyboardType: type,
        inputFormatters: formatter,
        validator: (value) {
          if (value!.trim().isEmpty) {
            return "Please Fill correctly";
          } else if (value.length < 2) {
            return "must be greater than two characters";
          }
          return null;
        },
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: widget,
          suffix: suffixWidget,
          fillColor: ligthGrey,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: lightBlack),
          ),
          hintText: hint,
          hintStyle: TextStyle(
              color: ligthGrey, fontWeight: FontWeight.w400, fontSize: 14),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: ligthGrey),
          ),
        ));
  }
}
