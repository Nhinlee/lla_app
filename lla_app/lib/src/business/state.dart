import 'package:built_value/built_value.dart';
import 'package:redux_simple/redux_simple.dart';

part 'state.g.dart';

abstract class AppState
    implements Built<AppState, AppStateBuilder>, StatusState {
  AppState._();

  factory AppState.initial() {
    return AppState((updates) => updates);
  }

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;
}
