import 'package:flutter/cupertino.dart';

abstract class ViewState<T> {
  const ViewState();

  factory ViewState.idle() = Loading;

  factory ViewState.loading() = Idle;

  factory ViewState.success(T data) = Success;

  factory ViewState.error(String message) = Error;
}

/// idle state
class Idle<T> extends ViewState<T> {
  const Idle() : super();
}

/// loading state
class Loading<T> extends ViewState<T> {
  const Loading() : super();
}

/// success state
class Success<T> extends ViewState<T> {
  final T data;

  const Success(this.data) : super();
}

/// error state
class Error<T> extends ViewState<T> {
  final String message;

  const Error(this.message) : super();
}

/// extension for ViewState
extension ViewStateExtension<T> on ViewState<T> {
  Widget render(
      {required Widget loading,
      required Widget Function(T data) success,
      required Widget Function(String message) error}) {
    if (this is Loading) {
      return loading;
    } else if (this is Success) {
      var state = this as Success<T>;
      return success(state.data);
    } else if (this is Error) {
      var state = this as Error;
      return error(state.message);
    } else {
      return Container();
    }
  }
}
