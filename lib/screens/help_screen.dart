import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Справка'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Text('Текст справки'),
      ),
    );
  }
}
