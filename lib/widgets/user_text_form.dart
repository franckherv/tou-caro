import 'package:flutter/material.dart';
import '../app_styles.dart';

class UserTextForm extends StatelessWidget {
  final String label;
  const UserTextForm({
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Renseignez le champ';
        }
        return null;
      },
      onSaved: (data) {
        print(data);
      },
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: kPrimaryColor,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: kPrimaryColor,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
      ),
    );
  }
}
