import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/entity.dart';
import 'package:lla_app/presentation.dart';
import 'package:redux/redux.dart';
import 'package:redux_simple/redux_simple.dart';

class ProfileScreen<T extends AppState> extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState<T>();
}

class _ProfileScreenState<T extends AppState> extends State<ProfileScreen<T>> {
  late Store<T> _store;
  final _textController = TextEditingController();
  String _statusId = '';

  @override
  void didChangeDependencies() {
    _store = StoreProvider.of<T>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<T, UserEntity>(
        converter: (store) => store.state.userState.userInfo ?? UserEntity(),
        builder: (context, user) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildImageHeader(user),
                  buildProfileProperties(
                    iconData: Icons.person,
                    title: 'Name',
                    content: Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onEditProfileProperty: () async {
                      final saved = await editProfilePropertiesHandler(
                        'Name',
                        user.name,
                      );
                      if (saved) {
                        final editedName = _textController.text;

                        // Upload image to server
                        // final action = UpdateProfileAction(
                        //   (updates) => updates..name = editedName,
                        // );
                        // setState(() {
                        //   _statusId = action.statusId;
                        // });
                        // await _store.dispatch(action);
                      }
                    },
                  ),
                  buildProfileProperties(
                    iconData: Icons.phone,
                    title: 'Phone',
                    content: Text(
                      "+84 ...",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    enableEditing: false,
                  ),
                ],
              ),
              AppStatusListener<T>(
                statusId: _statusId,
                builder: (status) {
                  return Visibility(
                    visible: status.loading == LoadingStatus.loading,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.borderLight10,
                      ),
                      child: const AppCircleLoading(),
                    ),
                  );
                },
                onError: (message) {
                  showSnackBar(message);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  buildImageHeader(UserEntity user) {
    const double radius = 120;
    return Container(
      padding: const EdgeInsets.all(16),
      height: radius * 2,
      width: radius * 2,
      child: Stack(
        children: [
          Center(
            child: CircleAvatar(
              radius: radius,
              backgroundColor: AppColors.secondary,
              foregroundImage: NetworkImage(
                "https://storage.googleapis.com/llapp-bucket/image_picker_F63D2238-D5CA-4BDA-96CB-163AA496CC06-63955-000024BE6AEFFE1A.jpg",
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: ElevatedButton(
              onPressed: () {
                onPickImageToUpload();
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(side: BorderSide.none),
                padding: const EdgeInsets.all(12),
                backgroundColor: AppColors.primary,
              ),
              child: const Icon(
                Icons.camera_alt,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildProfileProperties({
    required IconData iconData,
    required String title,
    required Widget content,
    bool enableEditing = true,
    Function()? onEditProfileProperty,
  }) {
    return ListTile(
      leading: Icon(iconData, size: 30),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: AppColors.grey,
        ),
      ),
      subtitle: content,
      trailing: enableEditing
          ? IconButton(
              icon: Icon(
                Icons.edit,
                size: 24,
                color: AppColors.primary,
              ),
              onPressed: () {
                onEditProfileProperty?.call();
              },
            )
          : null,
    );
  }

  void onPickImageToUpload() async {
    // Pick image from gallery
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      File file = File(result.files.single.path ?? '');

      // // Upload image to server
      // final action = UpdateProfileAction(
      //   (updates) => updates..file = file,
      // );
      // setState(() {
      //   _statusId = action.statusId;
      // });
      // await _store.dispatch(action);
    } else {
      // User canceled the picker
    }
  }

  Future<bool> editProfilePropertiesHandler(
    String title,
    String value,
  ) async {
    _textController.text = value;

    final focusNode = FocusNode();
    Future.delayed(Duration.zero, () {
      focusNode.requestFocus();
    });

    final result = await showModalBottomSheet<bool>(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your $title',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextField(
                controller: _textController,
                focusNode: focusNode,
                maxLines: 1,
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  buildDialogTextButton(
                    text: 'Cancel',
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  buildDialogTextButton(
                    text: 'Save',
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );

    return result ?? false;
  }

  Widget buildDialogTextButton({
    Function()? onPressed,
    required String text,
  }) {
    return TextButton(
      onPressed: () {
        onPressed?.call();
      },
      style: TextButton.styleFrom(
        foregroundColor: AppColors.secondary,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Future<void> showSnackBar(
    String message,
  ) async {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(message),
        actions: [],
      ),
    );
  }
}
