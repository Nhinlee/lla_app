import 'dart:io';

import 'package:built_value/built_value.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/entity.dart';
import 'package:redux/redux.dart';
import 'package:redux_simple/redux_simple.dart';

part 'li_actions.g.dart';

abstract class UploadLIItemAction extends Object
    with GenStatusId
    implements
        MiddlewareWithStatusAction<AppState>,
        Built<UploadLIItemAction, UploadLIItemActionBuilder> {
  LearningItemEntity get learningItem;

  File get file;

  @override
  Stream<AppState> call(
    Store<AppState> store,
  ) async* {
    final fileName = file.path.split('/').last;

    // check if image is have in state
    String imageURL = store.state.liState.imageUrlByImageNames[fileName] ?? '';
    if (imageURL.isEmpty) {
      final fileStoreUrl = await AppRepo.repo.getResumableUploadUrl(
        fileName,
      );

      await AppRepo.repo.uploadFile(
        file,
        fileStoreUrl.resumableUploadUrl,
      );

      imageURL = fileStoreUrl.publicUrl;
    }

    final newLearningItemId = await AppRepo.repo.uploadLearningItem(
      learningItem.rebuild(
        (p0) => p0..imageLink = imageURL,
      ),
    );

    final updatedLIs = {
      newLearningItemId: learningItem.rebuild(
        (p0) => p0
          ..id = newLearningItemId
          ..imageLink = imageURL,
      ),
      ...store.state.liState.learningItems.toMap(),
    };

    yield store.state.rebuild(
      (b) => b..liState.learningItems = MapBuilder(updatedLIs),
    );
  }

  factory UploadLIItemAction.create({
    required String englishWord,
    required String vietnameseWord,
    required File file,
    required List<String> enTexts,
    String? topicId,
  }) {
    return UploadLIItemAction(
      (updates) => updates
        ..learningItem = LearningItemEntity(
          (b) => b
            ..englishWord = englishWord
            ..vietnameseWord = vietnameseWord
            ..englishSentences = ListBuilder(enTexts)
            ..topicId = topicId,
        ).toBuilder()
        ..file = file,
    );
  }

  UploadLIItemAction._();

  factory UploadLIItemAction(
          [void Function(UploadLIItemActionBuilder) updates]) =
      _$UploadLIItemAction;
}

abstract class GetLIItemsAction extends Object
    with GenStatusId
    implements
        MiddlewareWithStatusAction<AppState>,
        Built<GetLIItemsAction, GetLIItemsActionBuilder> {
  @override
  Stream<AppState> call(
    Store<AppState> store,
  ) async* {
    final learningItems = await AppRepo.repo.getLearningItems();

    Map<String, LearningItemEntity> learningItemsMap = {};
    for (var e in learningItems) {
      learningItemsMap[e.id] = e;
    }

    yield store.state.rebuild(
      (b) => b.liState..learningItems = MapBuilder(learningItemsMap),
    );
  }

  GetLIItemsAction._();

  factory GetLIItemsAction([void Function(GetLIItemsActionBuilder) updates]) =
      _$GetLIItemsAction;
}

abstract class UploadImageAndGenerateTitleAction
    with
        GenStatusId
    implements
        MiddlewareWithStatusAction<AppState>,
        Built<UploadImageAndGenerateTitleAction,
            UploadImageAndGenerateTitleActionBuilder> {
  File get file;

  @override
  Stream<AppState> call(
    Store<AppState> store,
  ) async* {
    final fileName = file.path.split('/').last;
    final fileStoreUrl = await AppRepo.repo.getResumableUploadUrl(
      fileName,
    );

    await AppRepo.repo.uploadFile(
      file,
      fileStoreUrl.resumableUploadUrl,
    );

    yield store.state.rebuild(
      (b) => b
        ..liState.imageUrlByImageNames.addAll({
          fileName: fileStoreUrl.publicUrl,
        }),
    );

    final titles = await AppRepo.repo.generateImageTitles(
      imageName: fileName,
    );

    yield store.state.rebuild(
      (b) => b
        ..liState.imageTitlesByImageNames.addAll({
          fileName: titles,
        }),
    );
  }

  factory UploadImageAndGenerateTitleAction.create({
    required File file,
  }) {
    return UploadImageAndGenerateTitleAction(
      (updates) => updates..file = file,
    );
  }

  UploadImageAndGenerateTitleAction._();

  factory UploadImageAndGenerateTitleAction(
          [void Function(UploadImageAndGenerateTitleActionBuilder) updates]) =
      _$UploadImageAndGenerateTitleAction;
}

abstract class GenerateEnglishSentencesAction
    with
        GenStatusId
    implements
        MiddlewareWithStatusAction<AppState>,
        Built<GenerateEnglishSentencesAction,
            GenerateEnglishSentencesActionBuilder> {
  String get englishWord;

  String get imageName;

  @override
  Stream<AppState> call(
    Store<AppState> store,
  ) async* {
    final englishSentences = await AppRepo.repo.generateEnglishSentences(
      englishWord: englishWord,
    );

    yield store.state.rebuild(
      (b) => b
        ..liState.englishSentencesByImageNames.addAll({
          imageName: englishSentences,
        }),
    );
  }

  factory GenerateEnglishSentencesAction.create({
    required String englishWord,
    required String imageName,
  }) {
    return GenerateEnglishSentencesAction(
      (updates) => updates
        ..englishWord = englishWord
        ..imageName = imageName,
    );
  }

  GenerateEnglishSentencesAction._();

  factory GenerateEnglishSentencesAction(
          [void Function(GenerateEnglishSentencesActionBuilder) updates]) =
      _$GenerateEnglishSentencesAction;
}
