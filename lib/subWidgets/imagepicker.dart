import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/provider/imagepickerprovider.dart';
import 'package:provider/provider.dart';

class Imagepickerr extends StatelessWidget {
  const Imagepickerr({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ImagePickerProvider>();
    // final Provider2 = context.read<ImagePickerProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('Image Picker'), centerTitle: true),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey.shade400),
              child: Center(
                child: provider.file == null
                    ? Text('Image Not selected')
                    : Image.file(File(provider.file!.path), fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                provider.imagePickerlogic1();
                // print(photo!.path);
              },
              child: Text('Get Photo'),
            ),
            ElevatedButton(
              onPressed: () {
                // final XFile? photo = await _picker.pickImage(
                //   source: ImageSource.gallery,
                // );
                provider.imagepickerlogic2();
                // print(photo!.path);
                for (int i = 0; i < provider.files!.length; i++) {
                  print(provider.files![i].path);
                }
              },
              child: Text('Get Photos'),
            ),
          ],
        ),
      ),
    );
  }
}

/*



final imagePicker _picker = imagePicker();
XFile? file;
List<XFile>? files;

final XFile? photos = await _piker.pickImage(
souce = ImageSource.gallery //for single img

final list<XFile?> photos = await_picker.pickMultiImage(
) // for mul img

*/
