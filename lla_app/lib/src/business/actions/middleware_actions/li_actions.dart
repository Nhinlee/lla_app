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
    final fileStoreUrl = await AppRepo.repo.getResumableUploadUrl(
      fileName,
    );

    await AppRepo.repo.uploadFile(
      file,
      fileStoreUrl.resumableUploadUrl,
    );

    await AppRepo.repo.uploadLearningItem(
      learningItem.rebuild(
        (p0) => p0..imageLink = fileStoreUrl.publicUrl,
      ),
    );

    yield store.state;
  }

  factory UploadLIItemAction.create({
    required String englishWord,
    required String vietnameseWord,
    required File file,
  }) {
    return UploadLIItemAction(
      (updates) => updates
        ..learningItem = LearningItemEntity(
          (b) => b
            ..englishWord = englishWord
            ..vietnameseWord = vietnameseWord,
        ).toBuilder()
        ..file = file,
    );
  }

  UploadLIItemAction._();

  factory UploadLIItemAction(
          [void Function(UploadLIItemActionBuilder) updates]) =
      _$UploadLIItemAction;
}