import 'package:flutter/material.dart';
import 'package:womanaiapp/core/base/state/state.dart';

class AnswerCard extends BaseStateless {
  final String text;
  final VoidCallback onPressed;

  AnswerCard({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: colors.lightPurple2),
        ),
      ),
    );
  }
}
