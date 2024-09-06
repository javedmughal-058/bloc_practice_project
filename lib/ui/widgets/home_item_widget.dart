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
        margin: EdgeInsets.symmetric(vertical: kPadding / 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(-1, 1)
            ),
          ]
        ),
        child: Text(title, style: Theme.of(context).textTheme.titleSmall),
      ),
    );
  }
}
