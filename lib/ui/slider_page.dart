import 'package:bloc_practice_project/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_practice_project/bloc/switch_example/switch_event.dart';
import 'package:bloc_practice_project/bloc/switch_example/switch_state.dart';
import 'package:bloc_practice_project/ui/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, title: 'Slider Page'),
      body: BlocBuilder<SwitchBloc, SwitchState>(
          buildWhen: (previous, current) => previous.isSwitchOn != current.isSwitchOn,
          builder: (context, state){
            return Column(
              children: [
                Switch(
                  activeColor: Theme.of(context).primaryColor,
                  value: state.isSwitchOn, onChanged: (value){
                    context.read<SwitchBloc>().add(EnableDisableNotification());
                }),
                BlocBuilder<SwitchBloc, SwitchState>(
                    buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
                    builder: (context, innerState){
                      return Column(
                        children: [
                          Container(
                            height: 200,
                            color: !state.isSwitchOn ? Colors.grey.shade200 : Theme.of(context).primaryColor.withOpacity(innerState.sliderValue),
                          ),
                          Slider.adaptive(
                            activeColor: state.isSwitchOn ? Theme.of(context).primaryColor : Colors.grey,
                            value: innerState.sliderValue, onChanged: (value){
                              if(state.isSwitchOn){
                                context.read<SwitchBloc>().add(SliderEvent(slider: value));
                              }
                          }),
                        ],
                      );
                    }),
              ],
            );
          }),
    );
  }
}
