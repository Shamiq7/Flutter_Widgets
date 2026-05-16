// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();
  XFile? file;
  List<XFile>? files;

  void imagePickerlogic1() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      file = photo;
    }

    notifyListeners();
  }

  void imagepickerlogic2() async {
    final List<XFile> photos = await _picker.pickMultiImage(
      // source: ImageSource.gallery,
    );
    files = photos;
      notifyListeners();
  }

}
