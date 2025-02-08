import 'dart:io';

import 'package:batt_ds/batt_ds.dart';
import 'package:batt_onboarding/src/util/mrz_reader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:batt_onboarding/l10n/onboarding_localizations.dart';

final class ImagePickerWidget extends StatefulWidget {
  final Function(File?) onPicked;
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
  XFile? _originalImage;
  CroppedFile? _croppedFile;

  @override
  Widget build(BuildContext context) {
    return _originalImage == null && _croppedFile == null
        ? _pickers(context)
        : _imageCard(context);
  }

  Widget _pickers(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: kIsWeb
          ? [
              BattIconTextButton(
                onPressed: () async {
                  final XFile? photo = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);

                  if (photo != null) {
                    setState(() {
                      _originalImage = photo;
                      widget.onPicked(File(photo.path));
                    });
                  }
                },
                label: "Pick an image",
                icon: Icons.image,
              ),
            ]
          : [
              BattIconTextButton(
                onPressed: () async {
                  final XFile? photo =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  if (photo != null) {
                    setState(() {
                      _originalImage = photo;
                    });
                  }
                },
                label: 'Take a photo',
                icon: Icons.camera_alt,
              ),
              Spacer(),
              IconButton(
                onPressed: () async {
                  final XFile? photo = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);

                  if (photo != null) {
                    setState(() {
                      _originalImage = photo;
                    });
                  }
                },
                icon: Icon(
                  Icons.image,
                  color: context.buttonTheme.primaryDefault,
                ),
              ),
            ],
    );
  }

  Widget _imageCard(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Card(
            elevation: 4.0,
            child: _image(context),
          ),
          _menu(context),
        ],
      ),
    );
  }

  Widget _image(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if (_croppedFile != null) {
      final path = _croppedFile!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.8 * screenWidth,
          maxHeight: 0.7 * screenHeight,
        ),
        child: kIsWeb ? Image.network(path) : Image.file(File(path)),
      );
    } else if (_originalImage != null) {
      final path = _originalImage!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.8 * screenWidth,
          maxHeight: 0.7 * screenHeight,
        ),
        child: kIsWeb ? Image.network(path) : Image.file(File(path)),
      );
    } else {
      return Container();
    }
  }

  Widget _menu(BuildContext context) {
    return Padding(
      padding: AppPaddings.small.bottom,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          OrangeOutlinedBattButton(
            onPressed: () {
              widget.onPicked(null);
              setState(() {
                _croppedFile = null;
                _originalImage = null;
              });
            },
            label: OnboardingLocalizations.of(context).imageCropperActionDelete,
            leading: (color) => Icon(Icons.delete, color: color),
          ),
          if (_croppedFile == null) SizedBox(width: AppSpacings.xl),
          if (_croppedFile == null)
            OrangeSolidTextButton(
              onPressed: () {
                _cropImage(context);
              },
              label: OnboardingLocalizations.of(context).imageCropperActionCrop,
              leading: (color) => Icon(Icons.crop, color: color),
            ),
        ],
      ),
    );
  }

  Future<void> _cropImage(BuildContext context) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: _originalImage!.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 50,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: OnboardingLocalizations.of(context).imageCropperTitle,
          toolbarColor: AppColors.warning,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
            CropAspectRatioPreset.ratio5x3
          ],
        ),
        IOSUiSettings(
          title: OnboardingLocalizations.of(context).imageCropperTitle,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
            CropAspectRatioPreset.ratio5x3
          ],
        ),
        WebUiSettings(
          context: context,
          themeData: WebThemeData(
              doneIcon: Icons.done,
              rotateIconColor: Theme.of(context).highlightColor),
          presentStyle: WebPresentStyle.dialog,
          size: CropperSize(
            width: (MediaQuery.of(context).size.width / 2).round(),
            height: (MediaQuery.of(context).size.height / 2).round(),
          ),
        ),
      ],
    );
    if (croppedFile != null) {
      setState(() {
        _croppedFile = croppedFile;
        File result = File(croppedFile.path);

        if (!kIsWeb) {
          MRZReader().readImage(
              result,
              (rrn, surName, firstName, licenseNumber) => widget.onDataFound !=
                      null
                  ? widget.onDataFound!(rrn, surName, firstName, licenseNumber)
                  : {});
        }
        widget.onPicked(result);
      });
    }
  }
}
