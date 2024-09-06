import 'package:bloc/bloc.dart';
import 'package:bloc_practice_project/bloc/switch_example/switch_event.dart';
import 'package:bloc_practice_project/bloc/switch_example/switch_state.dart';


class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableDisableNotification>(_changeSwitchButton);
    on<SliderEvent>(_changeSliderValue);
  }

  void _changeSwitchButton(EnableDisableNotification event, Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitchOn: !state.isSwitchOn));
  }
  void _changeSliderValue(SliderEvent event, Emitter<SwitchState> emit){
    emit(state.copyWith(sliderValue: event.slider));
  }

}
