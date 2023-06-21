
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   final TextEditingController controller;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String hintText;
  const CustomTextFormField({super.key, required this.controller, this.onTap, this.onChanged, this.validator, this.onSaved, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onTap: onTap,
        onChanged: onChanged,
        validator: validator,
        onSaved: onSaved,
        controller: controller,
        style: Theme.of(context).textTheme.headline5,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
  }
}