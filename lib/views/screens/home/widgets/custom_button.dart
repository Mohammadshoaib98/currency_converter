import 'package:flutter/material.dart';

  class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String txtBtn;
  const CustomButton({super.key, this.onPressed, required this.txtBtn});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(15),
              textStyle: const TextStyle(fontSize: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: onPressed,
            child:  Text(txtBtn),
          ),
        ),
      ],
    );
  }
}
