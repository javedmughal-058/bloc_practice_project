import 'package:image_picker/image_picker.dart';

class ImagePickerUtils{


  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> pickImage({ImageSource imageSource = ImageSource.gallery}) async{
    return await _imagePicker.pickImage(source: imageSource);
  }


}