import 'package:flutter/cupertino.dart';

abstract class ViewState<T> {
  const ViewState();

  factory ViewState.idle() = ViewStateIdle;

  factory ViewState.loading() = ViewStateLoading;

  factory ViewState.success(T data) = ViewStateSuccess;

  factory ViewState.error(String message) = ViewStateError;
}

/// idle state
class ViewStateIdle<T> extends ViewState<T> {
  const ViewStateIdle() : super();
}

/// loading state
class ViewStateLoading<T> extends ViewState<T> {
  const ViewStateLoading() : super();
}

/// success state
class ViewStateSuccess<T> extends ViewState<T> {
  final T data;

  const ViewStateSuccess(this.data) : super();
}

/// error state
class ViewStateError<T> extends ViewState<T> {
  final String message;

  const ViewStateError(this.message) : super();
}

/// extension for ViewState
extension ViewStateExtension<T> on ViewState<T> {
  Widget render(
      {required Widget loading,
      required Widget Function(T data) success,
      required Widget Function(String message) error}) {
    if (this is ViewStateLoading) {
      return loading;
    } else if (this is ViewStateSuccess) {
      var state = this as ViewStateSuccess<T>;
      return success(state.data);
    } else if (this is ViewStateError) {
      var state = this as ViewStateError;
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
    if (viewState is ViewStateLoading) {
      return loading ?? const SizedBox.shrink();
    } else if (viewState is ViewStateSuccess) {
      var state = viewState as ViewStateSuccess<T>;
      return success(state.data);
    } else if (viewState is ViewStateError) {
      var state = viewState as ViewStateError;
      return error?.call(state.message) ?? const SizedBox.shrink();
    } else {
      return const SizedBox.shrink(); // Default fallback if no match
    }
  }
}
