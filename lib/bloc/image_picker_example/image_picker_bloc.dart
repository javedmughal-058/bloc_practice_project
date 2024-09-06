import 'package:bloc/bloc.dart';
import 'package:bloc_practice_project/bloc/image_picker_example/image_picker_event.dart';
import 'package:bloc_practice_project/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'image_picker_state.dart';


class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(const ImagePickerState()) {
    on<PickImageFromCamera>(_pickImageFromGallery);
    on<PickImageFromGallery>(_pickImageFromCamera);
  }

  Future<void> _pickImageFromGallery(PickImageFromCamera event, Emitter<ImagePickerState> emit) async {
    final ImagePickerUtils imagePickerUtils = ImagePickerUtils();
    XFile? file = await imagePickerUtils.pickImage();
    emit(state.copyWith(file: file));
  }
  Future<void> _pickImageFromCamera(PickImageFromGallery event, Emitter<ImagePickerState> emit) async {
    final ImagePickerUtils imagePickerUtils = ImagePickerUtils();
    XFile? file = await imagePickerUtils.pickImage(imageSource: ImageSource.camera);
    emit(state.copyWith(file: file));
  }

}
