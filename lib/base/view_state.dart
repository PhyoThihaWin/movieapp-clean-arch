import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

sealed class ViewState<T> {
  const ViewState();
  factory ViewState.idle() = ViewStateIdle;
  factory ViewState.loading() = ViewStateLoading;
  factory ViewState.success(T data) = ViewStateSuccess;
  factory ViewState.error(String message) = ViewStateError;
}

/// idle state
class ViewStateIdle<T> extends ViewState<T> {}

/// loading state
class ViewStateLoading<T> extends ViewState<T> {}

/// success state
class ViewStateSuccess<T> extends ViewState<T> {
  final T data;
  ViewStateSuccess(this.data);
}

/// error state
class ViewStateError<T> extends ViewState<T> {
  final String message;
  ViewStateError(this.message);
}

class ViewStateRender<T> extends StatelessWidget {
  final ViewState<T> viewState;
  final Widget? loading;
  final Widget Function(T data) success;
  final Widget Function(String message)? error;

  const ViewStateRender({
    super.key,
    required this.viewState,
    this.loading,
    required this.success,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return switch (viewState) {
      ViewStateIdle<T>() => const SizedBox.shrink(),
      ViewStateLoading() => loading ?? const SizedBox.shrink(),
      ViewStateSuccess(data: var data) => success(data),
      ViewStateError(message: var message) =>
        error?.call(message) ?? const SizedBox.shrink(),
    };
  }
}

class StateRender<T> extends StatelessWidget {
  final AsyncValue<T> refValue;
  final Widget? loading;
  final Widget Function(T data) success;
  final Widget Function(String message)? error;

  const StateRender({
    super.key,
    required this.refValue,
    this.loading,
    required this.success,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return refValue.when(
      loading: () => this.loading ?? const SizedBox.shrink(),
      data: (data) => success(data),
      error: (error, stackTrace) =>
          this.error?.call(error.toString()) ?? const SizedBox.shrink(),
    );
  }
}
