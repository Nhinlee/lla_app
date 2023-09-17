import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/presentation.dart';
import 'package:redux/redux.dart';
import 'package:redux_simple/redux_simple.dart';

class AIGenerateContainer<T extends AppState> extends StatefulWidget {
  const AIGenerateContainer({
    super.key,
    required this.imageFile,
    required this.onFinishGenerate,
  });

  final File imageFile;
  final Function(String) onFinishGenerate;

  @override
  State<AIGenerateContainer> createState() => _AIGenerateContainerState<T>();
}

class _AIGenerateContainerState<T extends AppState>
    extends State<AIGenerateContainer> {
  late Store<T> _store;
  String _generateTitleStatusId = '';
  String _chooseTitle = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _store = StoreProvider.of<T>(context);

    uploadImageAndGenerateTitle();
  }

  void uploadImageAndGenerateTitle() {
    final action = UploadImageAndGenerateTitleAction.create(
      file: widget.imageFile,
    );

    setState(() {
      _generateTitleStatusId = action.statusId;
    });
    _store.dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppStatusListener(
          statusId: _generateTitleStatusId,
          onError: (error) {
            AppToast.showError(error);
          },
          builder: (status) {
            if (status.loading == LoadingStatus.loading) {
              return buildWaitingGenerateWidget();
            }

            final imageName = widget.imageFile.path.split('/').last;
            final generatedTitles =
                _store.state.liState.imageTitlesByImageNames[imageName] ??
                    BuiltList<String>();

            // Build wrap of chip that contain generated titles and can be selected
            return buildBody(generatedTitles, context);
          },
        ),
      ],
    );
  }

  Widget buildWaitingGenerateWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AppCircleLoading(isCenter: false, size: 20),
        const SizedBox(width: 16),
        Text('Generating title...', style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget buildBody(BuiltList<String> generatedTitles, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Suggestions for title",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 0,
          children: [
            for (final title in generatedTitles)
              ActionChip(
                padding: const EdgeInsets.all(8),
                label: Text(
                  title,
                  style: TextStyle(
                    color: _chooseTitle == title
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                  ),
                ),
                backgroundColor: _chooseTitle == title
                    ? Theme.of(context).primaryColor
                    : null,
                onPressed: () {
                  setState(() {
                    _chooseTitle = title;
                  });
                },
              ),
          ],
        ),
        const SizedBox(height: 24),
        AppIconButton(
          onPressed: _chooseTitle.isEmpty
              ? null
              : () {
                  widget.onFinishGenerate(_chooseTitle);
                },
          icon: Icons.check,
        )
      ],
    );
  }
}
