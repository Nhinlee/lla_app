import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lla_app/business.dart';
import 'package:redux/redux.dart';
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
  final _imagePicker = ImagePicker();
  final _englishTextController = TextEditingController();
  final _vietnameseTextController = TextEditingController();

  double _screenSize = 0.0;

  late Store<T> _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenSize = MediaQuery.of(context).size.width;
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
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.file(
            File(imageFile.path),
            width: _screenSize,
            height: _screenSize,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: buildTextFormContainer(),
          ),
        ],
      ),
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
            Expanded(
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
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Add icon button,
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
                child: Icon(
                  Icons.add,
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        buildSentenceItem(),
        const SizedBox(height: 16),
        buildSentenceItem(),
      ],
    );
  }

  Widget buildSentenceItem() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: buildInputDecoration(
              labelText: 'English',
            ),
          ),
        ),
        const SizedBox(width: 16),
        // Delete icon button with red color
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
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
      border: OutlineInputBorder(
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
    );
    _store.dispatch(action);

    _englishTextController.clear();
    _vietnameseTextController.clear();
  }
}
