import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final String label;
  final Widget destination;
  final bool replace;

  const NavigationButton({
    Key? key,
    required this.label,
    required this.destination,
    this.replace = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (replace) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        }
      },
      child: Text(label),
    );
  }
}