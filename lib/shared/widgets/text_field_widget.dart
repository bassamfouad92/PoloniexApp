import 'package:flutter/material.dart';

Widget textFieldWidget(
    BuildContext context, String name, TextEditingController controller,
    {bool obscureText = false,
      floatingLabel = FloatingLabelBehavior.auto,
      TextInputType inputType = TextInputType.text,
      Function(String newText)? onChangeText,
      VoidCallback? onTap}) {

  return InkWell(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.purpleAccent)),
          child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: inputType,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  floatingLabelBehavior: floatingLabel,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                  labelText: name),
              onChanged: (newText) => onChangeText?.call(newText))
      ));
}