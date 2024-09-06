import 'package:flutter/material.dart';

AppBar appBarWidget(context, { String? title, List<Widget>? action }) => AppBar(
  backgroundColor: Theme.of(context).primaryColor,
  centerTitle: title == null ? true : false,
  title: title == null
      ? RichText(
        text: TextSpan(
          children: [
            TextSpan(text: 'Bloc Practice ', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).secondaryHeaderColor, fontSize: 20)),
            TextSpan(text: 'Project ', style: Theme.of(context).textTheme.titleMedium),
          ]
      ))
      : Text(title, style: Theme.of(context).textTheme.titleMedium),
);