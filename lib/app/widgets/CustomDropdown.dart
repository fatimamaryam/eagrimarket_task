import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  List<DropdownMenuItem<Object>>? items;
  var value;
  String hint;
  void Function(Object?)? onChangeHandler;
  CustomDropDown(
      {Key? key,
      this.items,
      this.value,
      required this.hint,
      this.onChangeHandler})
      : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.black26)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            iconEnabledColor: Colors.black26,
            isExpanded: true,
            hint: Text(
              widget.hint,
              style: const TextStyle(fontSize: 14, color: Colors.black26),
            ),
            // Not necessary for Option 1
            value: widget.value,
            onChanged: widget.onChangeHandler,
            items: widget.items,
          ),
        ),
      ),
    );
  }
}
