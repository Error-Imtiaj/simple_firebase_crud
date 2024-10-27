import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String? title;
  const TitleText({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 42),
    );
  }
}
