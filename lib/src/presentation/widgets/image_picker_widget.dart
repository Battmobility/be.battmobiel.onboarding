import 'dart:io';

import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/src/util/mrz_reader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final class ImagePickerWidget extends StatefulWidget {
  final Function(File) onPicked;
  final Function(String? rrn, String? surName, String? firstName,
      String? licenseNumber)? onDataFound;

  const ImagePickerWidget({
    required this.onPicked,
    this.onDataFound,
    super.key,
  });

  @override
  ImagePickerWidgetState createState() => ImagePickerWidgetState();
}

class ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.medium.all,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface,
          width: 0.5,
        ),
        borderRadius: BorderRadius.all(CornerRadii.m),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: kIsWeb
              ? [
                  IconButton(
                    onPressed: () async {
                      final XFile? photo = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);

                      if (photo != null) {
                        final file = File(photo.path);
                        MRZReader().readImage(
                            file,
                            (rrn, surName, firstName, licenseNumber) =>
                                widget.onDataFound != null
                                    ? widget.onDataFound!(
                                        rrn, surName, firstName, licenseNumber)
                                    : {});
                        photo.readAsBytes().then((bytes) {
                          widget.onPicked(file);
                        });
                      }
                    },
                    icon: Icon(
                      Icons.image,
                      color: context.buttonTheme.primaryDefault,
                    ),
                  ),
                ]
              : [
                  IconButton(
                    onPressed: () async {
                      final XFile? photo = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      if (photo != null) {
                        final file = File(photo.path);
                        MRZReader().readImage(
                            file,
                            (rrn, surName, firstName, licenseNumber) =>
                                widget.onDataFound != null
                                    ? widget.onDataFound!(
                                        rrn, surName, firstName, licenseNumber)
                                    : {});
                        photo.readAsBytes().then((bytes) {
                          widget.onPicked(file);
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
                      final XFile? photo = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);

                      if (photo != null) {
                        final file = File(photo.path);
                        MRZReader().readImage(
                            file,
                            (rrn, surName, firstName, licenseNumber) =>
                                widget.onDataFound != null
                                    ? widget.onDataFound!(
                                        rrn, surName, firstName, licenseNumber)
                                    : {});
                        photo.readAsBytes().then((bytes) {
                          widget.onPicked(file);
                        });
                      }
                    },
                    icon: Icon(
                      Icons.image,
                      color: context.buttonTheme.primaryDefault,
                    ),
                  ),
                ]),
    );
  }
}
