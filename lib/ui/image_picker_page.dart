import 'dart:io';

import 'package:bloc_practice_project/bloc/image_picker_example/image_picker_bloc.dart';
import 'package:bloc_practice_project/bloc/image_picker_example/image_picker_event.dart';
import 'package:bloc_practice_project/bloc/image_picker_example/image_picker_state.dart';
import 'package:bloc_practice_project/ui/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerPage extends StatelessWidget {
  const ImagePickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: appBarWidget(context, title: 'Image Picker Page'),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (context, state){
              return state.file == null
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                          context.read<ImagePickerBloc>().add(PickImageFromCamera());
                        }, child: const Text('Pick Image Using Camera')),
                      ElevatedButton(onPressed: (){
                          context.read<ImagePickerBloc>().add(PickImageFromCamera());
                        }, child: const Text('Pick Image Using Gallery')),
                    ],
                  )
                  : Image.file(File(state.file!.path.toString()));
            }),
      ),
    );
  }
}
