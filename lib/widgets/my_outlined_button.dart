import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(40)),
          alignment: Alignment.center,
          textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize: 20)),
          foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onSurface),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(15)),
        ),
        child: Text(text),
      ),
    );
  }
}
