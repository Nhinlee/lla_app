import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lla_app/presentation.dart';

class PickImageBottomSheet extends StatefulWidget {
  const PickImageBottomSheet({super.key});

  @override
  State<PickImageBottomSheet> createState() => _PickImageBottomSheetState();
}

class _PickImageBottomSheetState extends State<PickImageBottomSheet> {
  final _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  final imageFile = await _getImage(
                    ImageSource.camera,
                  );
                  Navigator.of(context).pop(imageFile);
                },
                icon: Icon(
                  Icons.camera_alt,
                  color: AppColors.primary,
                  size: 40,
                ),
              ),
              const SizedBox(height: 8),
              const Text('Take a photo'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  final imageFile = await _getImage(
                    ImageSource.gallery,
                  );
                  Navigator.of(context).pop(imageFile);
                },
                icon: Icon(
                  Icons.photo,
                  color: AppColors.primary,
                  size: 40,
                ),
              ),
              const SizedBox(height: 8),
              const Text('Choose from gallery'),
            ],
          ),
        ],
      ),
    );
  }

  Future<XFile?> _getImage(ImageSource imageSource) async {
    final imageFile = await _imagePicker.pickImage(
      imageQuality: 100,
      preferredCameraDevice: CameraDevice.rear,
      source: imageSource,
    );

    return imageFile;
  }
}
