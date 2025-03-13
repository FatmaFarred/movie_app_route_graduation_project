import 'package:flutter/material.dart';

class ProfileNumpers extends StatelessWidget {
  final String text;

  const ProfileNumpers({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 48, vertical: 52),
      child: Text(
        text,
        style: const TextStyle(fontSize: 36, color: Colors.white),
      ),
    );
  }
}

class ProfileText extends StatelessWidget {
  final String text;

  const ProfileText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 52),
      child: Text(
        text,
        style: const TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}
