import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lla_app/business.dart';
import 'package:redux_simple/redux_simple.dart';

class AppStatusListener<T extends AppState> extends StatelessWidget {
  const AppStatusListener({
    Key? key,
    required this.statusId,
    this.builder,
    this.onSuccess,
    this.onError,
    this.loadingPlaceHolder,
  }) : super(key: key);

  final String statusId;
  final Function(Status)? builder;
  final Function(Status)? onSuccess;
  final Function(String message)? onError;
  final Widget? loadingPlaceHolder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<T, Status>(
      distinct: true,
      builder: (context, vm) {
        if (vm.loading == LoadingStatus.loading && loadingPlaceHolder != null) {
          return loadingPlaceHolder ?? const SizedBox();
        }
        return builder?.call(vm) ?? const SizedBox();
      },
      onWillChange: (preVM, newVM) {
        if (newVM.loading == LoadingStatus.success) {
          onSuccess?.call(newVM);
        }
        if (newVM.loading == LoadingStatus.error) {
          final errorMessage = newVM.message.split('\n').last;
          onError?.call(errorMessage);
        }
      },
      converter: (store) {
        return store.state.statuses[statusId] ?? Status.idle();
      },
    );
  }
}
