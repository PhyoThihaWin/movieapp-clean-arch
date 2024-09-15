import 'package:flutter/cupertino.dart';

abstract class ViewState<T> {
  const ViewState();

  factory ViewState.idle() = Idle;

  factory ViewState.loading() = Loading;

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

class RenderViewState<T> extends StatelessWidget {
  final ViewState<T> viewState;
  final Widget? loading;
  final Widget Function(T data) success;
  final Widget Function(String message)? error;

  const RenderViewState({
    super.key,
    required this.viewState,
    this.loading,
    required this.success,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    if (viewState is Loading) {
      return loading ?? const SizedBox.shrink();
    } else if (viewState is Success) {
      var state = viewState as Success<T>;
      return success(state.data);
    } else if (viewState is Error) {
      var state = viewState as Error;
      return error?.call(state.message) ?? const SizedBox.shrink();
    } else {
      return const SizedBox.shrink(); // Default fallback if no match
    }
  }
}
