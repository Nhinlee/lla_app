import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/presentation.dart';
import 'package:lla_app/src/presentation/container/app_status_container.dart';
import 'package:redux/redux.dart';
import 'package:redux_simple/redux_simple.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class UploadLIScreen<T extends AppState> extends StatefulWidget {
  const UploadLIScreen({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  final XFile imageFile;

  @override
  State<UploadLIScreen> createState() => _UploadLIScreenState<T>();
}

class _UploadLIScreenState<T extends AppState> extends State<UploadLIScreen> {
  final _englishTextController = TextEditingController();
  final _vietnameseTextController = TextEditingController();
  final _enTextControllers = <TextEditingController>[];

  late Size _screenSize;

  late Store<T> _store;
  String _uploadLIItemStatusId = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenSize = MediaQuery.of(context).size;
    _store = StoreProvider.of<T>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
      ),
      body: buildBody(
        widget.imageFile,
      ),
    );
  }

  Widget buildBody(XFile imageFile) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.file(
                File(imageFile.path),
                width: _screenSize.width,
                height: _screenSize.width,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: buildTextFormContainer(),
              ),
            ],
          ),
        ),
        AppStatusListener(
          statusId: _uploadLIItemStatusId,
          onSuccess: (status) {
            if (mounted) {
              context.pop();
            }
          },
          builder: (status) {
            if (status.loading == LoadingStatus.loading) {
              return buildLoadingContainer();
            }

            return const SizedBox.shrink();
          },
        )
      ],
    );
  }

  Widget buildLoadingContainer() {
    return Container(
      width: _screenSize.width,
      height: _screenSize.height,
      color: Colors.black.withOpacity(0.2),
      child: const AppCircleLoading(),
    );
  }

  Widget buildTextFormContainer() {
    return Column(
      children: [
        TextField(
          controller: _englishTextController,
          decoration: buildInputDecoration(
            labelText: 'English',
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _vietnameseTextController,
          decoration: buildInputDecoration(
            labelText: 'Vietnamese',
          ),
        ),
        const SizedBox(height: 32),
        buildSentencesContainer(),
        const SizedBox(height: 32),
        buildSaveButton(),
        const SizedBox(height: 64),
      ],
    );
  }

  Widget buildSaveButton() {
    return InkWell(
      onTap: () {
        onUploadLIItem(widget.imageFile);
      },
      child: Ink(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.purple.shade300,
            ],
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Container(
          alignment: Alignment.center,
          child: const Text(
            'Save',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSentencesContainer() {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Sentences',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.purple,
                  ),
                ),
                child: GradientText(
                  'AI Generate',
                  colors: [
                    Colors.purple,
                    Colors.purple.shade300,
                  ],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Add icon button,
            InkWell(
              onTap: () {
                setState(() {
                  _enTextControllers.add(
                    TextEditingController(),
                  );
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.purple,
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Column(
          children: List.generate(_enTextControllers.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: buildSentenceItem(
                _enTextControllers[index],
                index,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget buildSentenceItem(
    TextEditingController controller,
    int index,
  ) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: buildInputDecoration(
              labelText: 'English',
            ),
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {
            setState(() {
              _enTextControllers.removeAt(index);
            });
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 32,
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration buildInputDecoration({
    String? labelText,
  }) {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      labelText: labelText,
    );
  }

  void onUploadLIItem(XFile imageFile) {
    final englishText = _englishTextController.text;
    final vietnameseText = _vietnameseTextController.text;

    final action = UploadLIItemAction.create(
      englishWord: englishText,
      vietnameseWord: vietnameseText,
      file: File(imageFile.path),
      enTexts: _enTextControllers.map((e) => e.text).toList(),
    );
    setState(() {
      _uploadLIItemStatusId = action.statusId;
    });
    _store.dispatch(action);

    _englishTextController.clear();
    _vietnameseTextController.clear();
  }
}
