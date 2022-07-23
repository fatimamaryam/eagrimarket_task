import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  bool disabled;
  Function()? onTap;
  CustomButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled ? null : onTap,
      child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: disabled ? Colors.green[100] : Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
