import 'dart:io';

import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/src/util/mrz_reader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final class ImagePickerWidget extends StatefulWidget {
  final Function(Uint8List) onPicked;

  const ImagePickerWidget({required this.onPicked, super.key});

  @override
  ImagePickerWidgetState createState() => ImagePickerWidgetState();
}

class ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface,
          width: 0.5,
        ),
        borderRadius: BorderRadius.all(CornerRadii.m),
      ),
      child: Column(children: [
        IconButton(
          onPressed: () async {
            final XFile? photo =
                await ImagePicker().pickImage(source: ImageSource.camera);
            if (photo != null) {
              final file = File(photo.path);
              MRZReader().readImage(
                  file,
                  (rrn, surName, firstName) => {
                        print("$rrn $surName $firstName")
                      }); // TODO fill form with `patch`
              photo.readAsBytes().then((bytes) {
                widget.onPicked(bytes);
              });
            }
          },
          icon: Icon(
            Icons.camera_alt,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () async {
            final XFile? photo =
                await ImagePicker().pickImage(source: ImageSource.gallery);

            if (photo != null) {
              final file = File(photo.path);
              MRZReader().readImage(
                  file,
                  (rrn, surName, firstName) => {
                        print("$rrn $surName $firstName")
                      }); // TODO fill form with `patch`
              photo.readAsBytes().then((bytes) {
                widget.onPicked(bytes);
              });
            }
          },
          icon: Icon(
            Icons.image,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ]),
    );
  }
}
