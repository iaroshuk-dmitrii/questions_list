import 'package:flutter/material.dart';

class AnswerBox extends StatelessWidget {
  const AnswerBox({
    Key? key,
    required this.text,
    this.onPressed,
    this.color,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color?>(color),
          alignment: Alignment.centerLeft,
          textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
            fontStyle: FontStyle.italic,
          )),
          foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onSurface),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10)),
        ),
        child: Text(text),
      ),
    );
  }
}
