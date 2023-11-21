import 'package:flutter/material.dart';

buildRichText(BuildContext context, String title, String? value) => RichText(
  text: TextSpan(
    text: '$title: ',
    style: Theme.of(context).textTheme.titleSmall,
    children: [
      TextSpan(
        text: '$value',
        style: Theme.of(context).textTheme.bodyMedium
      ),
    ],
  ),
);