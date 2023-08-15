import 'package:built_value/built_value.dart';
import 'package:lla_app/business.dart';
import 'package:redux_simple/redux_simple.dart';

part 'state.g.dart';

abstract class AppState
    implements
        Built<AppState, AppStateBuilder>,
        AbstractLIFeature,
        StatusState {
  AppState._();

  factory AppState.initial() {
    return AppState(
      (updates) => updates..liState = LearningItemStateBuilder(),
    );
  }

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;
}
