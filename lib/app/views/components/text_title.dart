import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({Key? key, required this.text, this.color}) : super(key: key);

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: color,
        )
    );
  }
}
