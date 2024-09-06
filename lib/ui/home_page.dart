import 'package:bloc_practice_project/ui/slider_page.dart';
import 'package:bloc_practice_project/utils/navigator.dart';
import 'package:bloc_practice_project/ui/counter_page.dart';
import 'package:bloc_practice_project/ui/widgets/app_bar_widget.dart';
import 'package:bloc_practice_project/ui/widgets/home_item_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeItemWidget(title: 'Counter', onTap: ()=> context.push(const CounterPage())),
                HomeItemWidget(title: 'Slider', onTap: ()=> context.push(const SliderPage())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeItemWidget(title: 'Image Picker', onTap: (){}),
                HomeItemWidget(title: 'CRUD (List)', onTap: (){}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
