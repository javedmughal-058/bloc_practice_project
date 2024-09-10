import 'package:bloc_practice_project/utils/constant.dart';
import 'package:flutter/material.dart';

class HomeItemWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const HomeItemWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.35,
        height: size.height * 0.1,
        alignment: Alignment.center,
        padding: EdgeInsets.all(kPadding / 4),
        margin: EdgeInsets.symmetric(vertical: kPadding / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.secondaryContainer,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(-5, 1)
            ),
          ]
        ),
        child: Text(title, style: Theme.of(context).textTheme.titleSmall),
      ),
    );
  }
}
