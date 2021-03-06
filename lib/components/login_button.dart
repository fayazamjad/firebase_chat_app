import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton(this.color, this.text, this.click, {Key? key}) : super(key: key);
  late Color color;
  late String text;
  late Function() click;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: click,
          minWidth: 200.0,
          height: 42.0,
          child: Text(text),
        ),
      ),
    );
  }
}
