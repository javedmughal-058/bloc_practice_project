import 'dart:io';

import 'package:bloc_practice_project/bloc/image_picker_example/image_picker_bloc.dart';
import 'package:bloc_practice_project/bloc/image_picker_example/image_picker_event.dart';
import 'package:bloc_practice_project/bloc/image_picker_example/image_picker_state.dart';
import 'package:bloc_practice_project/ui/widgets/app_bar_widget.dart';
import 'package:bloc_practice_project/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerPage extends StatelessWidget {
  const ImagePickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: appBarWidget(context, title: 'Image Picker Page'),
      body: Center(
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
                          context.read<ImagePickerBloc>().add(PickImageFromGallery());
                        }, child: const Text('Pick Image Using Gallery')),
                    ],
                  )
                  : Stack(
                    alignment: Alignment.topRight,
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(File(state.file!.path.toString()), width: size.width * 0.75)),
                      Positioned(
                        top: -10,
                        right: -10,
                        child: GestureDetector(
                          onTap: (){
                            context.read<ImagePickerBloc>().add(ClearImageEvent());
                          },
                          child: Container(
                            padding: EdgeInsets.all(kPadding / 2),
                            decoration: BoxDecoration(
                              color: Colors.red.shade500,
                              shape: BoxShape.circle
                            ),
                            child: Icon(Icons.remove, color: Theme.of(context).dividerColor),
                          ),
                        ),
                      )
                    ],
                  );
            }),
      ),
    );
  }
}
