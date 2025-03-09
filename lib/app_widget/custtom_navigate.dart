import 'package:flutter/material.dart';

void customNavigate(BuildContext context, Widget targetScreen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => targetScreen,
    ),
  );
}
void customNavigatePR(BuildContext context, Widget targetScreen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => targetScreen,
    ),
  );
}
