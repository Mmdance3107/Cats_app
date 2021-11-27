import 'package:flutter/material.dart';

class ErrWidget extends StatelessWidget {
  const ErrWidget({Key? key, required this.message}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.red, fontSize: 24),
        ),
      ),
    );
  }
}
