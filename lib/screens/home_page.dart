import 'package:bloc_practice_project/bloc/localization/localization_bloc.dart';
import 'package:bloc_practice_project/bloc/news/news_bloc.dart';
import 'package:bloc_practice_project/bloc/news/news_event.dart';
import 'package:bloc_practice_project/screens/news_page.dart';
import 'package:bloc_practice_project/screens/slider_page.dart';
import 'package:bloc_practice_project/screens/todo_page.dart';
import 'package:bloc_practice_project/services/localization/app_localizations.dart';
import 'package:bloc_practice_project/utils/constant.dart';
import 'package:bloc_practice_project/utils/navigator.dart';
import 'package:bloc_practice_project/screens/counter_page.dart';
import 'package:bloc_practice_project/widgets/app_bar_widget.dart';
import 'package:bloc_practice_project/widgets/home_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'image_picker_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: appBarWidget(context, title: localizations?.translate('title') ?? "", action: [
        Switch.adaptive(
            value: !context.read<LocalizationBloc>().isEnglish,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (value)=> context.read<LocalizationBloc>().toggleLocalization()),
      ]),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: kPadding, horizontal: kPadding * 2),
        child: Column(
          children: [
            Text(localizations?.translate('greeting') ?? ''),
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
                HomeItemWidget(title: 'News', onTap: (){
                  // context.read<NewsBloc>().add(FetchNews(query: "technology"));
                  context.push(const NewsPage());
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
