import 'package:flutter/material.dart';

class TestPdfScreen extends StatefulWidget {
  const TestPdfScreen({Key? key}) : super(key: key);

  @override
  _TestPdfScreenState createState() => _TestPdfScreenState();
}

class _TestPdfScreenState extends State<TestPdfScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Test button'),
      ),
    ));
  }
}
