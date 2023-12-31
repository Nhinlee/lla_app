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
  final _enSentencesControllers = <TextEditingController>[];
  String _selectedTopicId = '';

  late Size _screenSize;

  late Store<T> _store;
  String _uploadLIItemStatusId = '';
  String _aiGenerateSentencesStatusId = '';
  bool _isGenerating = true;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.file(
                File(imageFile.path),
                width: _screenSize.width,
                height: _screenSize.width * 0.8,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 32),
              buildLIEditor(imageFile),
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
        ),
      ],
    );
  }

  Padding buildLIEditor(XFile imageFile) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: _isGenerating
          ? AIGenerateContainer(
              imageFile: File(imageFile.path),
              onFinishGenerate: (englishTitle) {
                _englishTextController.text = englishTitle;
                setState(() {
                  _isGenerating = false;
                });
              },
            )
          : buildTextFormContainer(),
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
        const SizedBox(height: 16),
        buildTopicDropdown(),
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
            buildAIGenerateSentencesContainer(),
            const SizedBox(width: 16),
            // Add icon button,
            InkWell(
              onTap: () {
                setState(() {
                  _enSentencesControllers.add(
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
          children: List.generate(_enSentencesControllers.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: buildSentenceItem(
                _enSentencesControllers[index],
                index,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget buildAIGenerateSentencesContainer() {
    return AppStatusListener(
      statusId: _aiGenerateSentencesStatusId,
      loadingPlaceHolder: const AppCircleLoading(),
      onSuccess: (status) {
        final enSentences = _store.state.liState
                .englishSentencesByImageNames[widget.imageFile.name] ??
            BuiltList<String>();

        if (mounted) {
          setState(() {
            for (final enSentence in enSentences) {
              _enSentencesControllers.add(
                TextEditingController(text: enSentence),
              );
            }
          });
        }
      },
      builder: (p0) {
        return InkWell(
          onTap: () {
            final action = GenerateEnglishSentencesAction.create(
              englishWord: _englishTextController.text,
              imageName: widget.imageFile.name,
            );
            setState(() {
              _enSentencesControllers.clear();
              _aiGenerateSentencesStatusId = action.statusId;
            });
            _store.dispatch(action);
          },
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
        );
      },
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
            minLines: 1,
            maxLines: 3,
            decoration: buildInputDecoration(
              labelText: 'English',
            ),
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {
            setState(() {
              _enSentencesControllers.removeAt(index);
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

  Widget buildTopicDropdown() {
    final topics = _store.state.topicState.topics;
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Topic',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: DropdownButtonFormField<String>(
            onChanged: (value) {
              setState(() {
                _selectedTopicId = value ?? '';
              });
            },
            items: topics.keys.map((id) {
              return DropdownMenuItem(
                value: id,
                child: Text(topics[id]?.name ?? ''),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void onUploadLIItem(XFile imageFile) {
    final englishText = _englishTextController.text;
    final vietnameseText = _vietnameseTextController.text;

    final action = UploadLIItemAction.create(
      englishWord: englishText,
      vietnameseWord: vietnameseText,
      file: File(imageFile.path),
      enTexts: _enSentencesControllers.map((e) => e.text).toList(),
      topicId: _selectedTopicId,
    );
    setState(() {
      _uploadLIItemStatusId = action.statusId;
    });
    _store.dispatch(action);

    _englishTextController.clear();
    _vietnameseTextController.clear();
    _enSentencesControllers.clear();
  }
}
