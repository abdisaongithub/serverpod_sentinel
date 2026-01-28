import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sentinel_shimmer.dart';
import 'error_view.dart';

typedef DataBuilder<T> = Widget Function(T data);

/// A unified widget for handling Loading, Error, and Success states of AsyncValue.
class SentinelStateView<T> extends StatelessWidget {
  /// The AsyncValue state from a Riverpod provider.
  final AsyncValue<T> state;

  /// The builder function for the Success state.
  final DataBuilder<T> builder;

  /// Optional custom loading view. Defaults to SentinelShimmer.box().
  final Widget? loadingView;

  /// Optional custom error builder.
  final Widget Function(Object error, StackTrace? stack)? errorBuilder;

  /// Callback for the retry button in the default ErrorView.
  final VoidCallback? onRetry;

  /// If true, shows a small loading indicator over the existing data during refresh.
  final bool showLoadingOnRefresh;

  const SentinelStateView({
    super.key,
    required this.state,
    required this.builder,
    this.loadingView,
    this.errorBuilder,
    this.onRetry,
    this.showLoadingOnRefresh = true,
  });

  @override
  Widget build(BuildContext context) {
    return state.when(
      data: (data) {
        if (state.isRefreshing && showLoadingOnRefresh) {
          return Stack(
            children: [
              builder(data),
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: LinearProgressIndicator(
                  minHeight: 2,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          );
        }
        return builder(data);
      },
      loading: () => loadingView ?? Center(child: SentinelShimmer.box(width: double.infinity, height: 200)),
      error: (error, stack) {
        if (errorBuilder != null) return errorBuilder!(error, stack);
        return ErrorView(
          message: error.toString(),
          onRetry: onRetry,
        );
      },
    );
  }
}
