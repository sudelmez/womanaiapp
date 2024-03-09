import 'package:flutter/material.dart';
import 'package:womanaiapp/core/base/state/state.dart';

class ButtonSpeech extends BaseStateless {
  final Function onPressed;
  final IconData icon;
  final double? heigt;
  ButtonSpeech({super.key, required this.icon, required this.onPressed, this.heigt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: heigt ?? 120.0,
      height: heigt ?? 120.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 5,
          ),
        ],
        color: colors.lightPurple2,
      ),
      child: IconButton(
        icon: Icon(icon),
        iconSize: heigt != null ? 100.0 : 60.0,
        color: Colors.white,
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
