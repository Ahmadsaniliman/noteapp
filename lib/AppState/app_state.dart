import 'package:flutter/material.dart';

@immutable
class AppState {
  final bool isLoading;

  const AppState({
    required this.isLoading,
  });

  const AppState.unKnown() : isLoading = false;

  AppState copyWith(bool isLoading) => AppState(
        isLoading: isLoading,
      );

  @override
  bool operator ==(covariant AppState other) => isLoading == other.isLoading;

  @override
  int get hashCode => isLoading.hashCode;
}
