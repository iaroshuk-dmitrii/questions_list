import 'package:flutter/material.dart';
import 'package:questions_list/widgets/my_outlined_button.dart';

Future<bool> onWillPopDialog({
  required BuildContext context,
  required String title,
  required VoidCallback onConfirm,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyOutlinedButton(
              text: 'Подтвердить',
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop(true);
              },
            ),
            MyOutlinedButton(
              text: 'Отмена',
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        ),
      ],
    ),
  ).then((value) => value ?? false);
}
