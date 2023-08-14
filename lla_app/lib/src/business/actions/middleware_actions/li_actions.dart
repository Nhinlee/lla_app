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

  @override
  Stream<AppState> call(
    Store<AppState> store,
  ) async* {
    final resumableUploadUrl = await AppRepo.repo.getResumableUploadUrl(
      "test-1.png",
    );

    print(">> resumableUploadUrl: $resumableUploadUrl");

    // await AppRepo.repo.uploadLearningItem(
    //   learningItem,
    // );
  }

  factory UploadLIItemAction.create({
    required String englishWord,
    required String vietnameseWord,
  }) {
    return UploadLIItemAction(
      (updates) => updates
        ..learningItem = LearningItemEntity(
          (b) => b
            ..englishWord = englishWord
            ..vietnameseWord = vietnameseWord,
        ).toBuilder(),
    );
  }

  UploadLIItemAction._();

  factory UploadLIItemAction(
          [void Function(UploadLIItemActionBuilder) updates]) =
      _$UploadLIItemAction;
}
