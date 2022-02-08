import 'package:flutter/material.dart';

class Text_Field_Widget extends StatelessWidget {
  Text_Field_Widget(
      {Key? key,
      required this.email_text,
      required this.onchanged,
      required this.check})
      : super(key: key);
  late Function(String) onchanged;
  late String email_text;
  late bool check;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      obscureText: check,
      textAlign: TextAlign.center,
      onChanged: onchanged,
      decoration: InputDecoration(
        hintText: email_text,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
