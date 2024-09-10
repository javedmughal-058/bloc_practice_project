import 'package:bloc_practice_project/ui/favourite_page.dart';
import 'package:bloc_practice_project/ui/slider_page.dart';
import 'package:bloc_practice_project/ui/todo_page.dart';
import 'package:bloc_practice_project/utils/constant.dart';
import 'package:bloc_practice_project/utils/navigator.dart';
import 'package:bloc_practice_project/ui/counter_page.dart';
import 'package:bloc_practice_project/ui/widgets/app_bar_widget.dart';
import 'package:bloc_practice_project/ui/widgets/home_item_widget.dart';
import 'package:flutter/material.dart';

import 'image_picker_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: kPadding, horizontal: kPadding * 2),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeItemWidget(title: 'Counter', onTap: ()=> context.push(const CounterPage())),
                HomeItemWidget(title: 'Slider', onTap: ()=> context.push(const SliderPage())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeItemWidget(title: 'Image Picker', onTap: ()=> context.push(const ImagePickerPage())),
                HomeItemWidget(title: 'Todo Example', onTap: ()=> context.push(const TodoPage())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeItemWidget(title: 'Favourite', onTap: ()=> context.push(const FavouritePage())),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
